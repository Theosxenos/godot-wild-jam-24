class_name ResourceBuilding extends Building

@export var resource_scene: PackedScene
@export var spawn_radius := 50
@export var spawn_radius_max := 55

func _on_hurtbox_hit(damage: int) -> void:
	current_health -= 1
	if current_health <= 0:
		spawn_resource()
	
func spawn_resource() -> void:
	current_health = max_health
	
	var resource := resource_scene.instantiate() as SpawnableResource
	var angle := randf_range(0, TAU)
	var direction := Vector2(cos(angle), sin(angle))
	
	resource.position = direction * randi_range(spawn_radius, spawn_radius_max)
	add_child(resource)
