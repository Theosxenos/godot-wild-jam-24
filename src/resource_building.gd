class_name ResourceBuilding extends Building

@export var resource: PackedScene


func _on_hurtbox_hit(damage: int) -> void:
	current_health -= 1
	if current_health <= 0:
		spawn_resource()
	
func spawn_resource() -> void:
	current_health = max_health
	print("Spawn resource %s" % current_health)
