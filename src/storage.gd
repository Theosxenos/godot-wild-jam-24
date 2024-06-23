class_name Storage extends StaticBody2D

signal stored_resource_updated(name: String, total: int)

@export var resource_amount :=  {
									"Wood": 0,
									"Gold": 0
								}

@export var tower_scene: PackedScene

func _ready() -> void:
	await get_owner().ready
	for r in resource_amount:
		stored_resource_updated.emit(r, resource_amount[r])

func _on_drop_area_area_entered(area: Area2D) -> void:
	if not area is SpawnableResource or area is SpawnableTower:
		return
	
	var resource := area as SpawnableResource
	var anim_player := resource.get_node("AnimationPlayer") as AnimationPlayer
	anim_player.play("spawn", -1, -1.3, true)
	
	resource_amount[resource.name] += 1
	stored_resource_updated.emit(resource.name, resource_amount[resource.name])
	
	await anim_player.animation_finished
	resource.queue_free()
	
	spawn_tower()
	
	
func spawn_tower() -> void:
	if resource_amount.Gold < Main.tower_gold_cost and resource_amount.Wood < Main.tower_wood_cost:
		return
		
	var tower := tower_scene.instantiate() as Area2D
	var angle := randf_range(0, TAU)
	var direction := Vector2(sin(angle), cos(angle))
	
	tower.position = direction * 60

	resource_amount.Gold -= Main.tower_gold_cost
	resource_amount.Wood -= Main.tower_wood_cost

	for r in resource_amount:
		stored_resource_updated.emit(r, resource_amount[r])
		
	
	add_child(tower)
