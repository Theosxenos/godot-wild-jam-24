extends Area2D

@export var cell_size := Vector2(64, 64)
@export var tower_scene: PackedScene

func _on_area_entered(area: Area2D) -> void:
	if not area is SpawnableTower:
		return

	var tower_position := area.global_position - global_position
	var cell_coordinates := Vector2(int(tower_position.x / cell_size.x), int(tower_position.y / cell_size.y))	

	await get_tree().create_timer(0.1).timeout
	area.queue_free()
	spawn_tower(cell_coordinates)
	

func spawn_tower(cell_coordinates: Vector2) -> void:
	var tower := tower_scene.instantiate()
	tower.position = cell_coordinates * cell_size + cell_size / 2
	add_child(tower)
