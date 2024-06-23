extends Area2D

@export var cell_size := Vector2(64, 64)

func _on_area_entered(area: Area2D) -> void:
	if not area is SpawnableTower:
		return
	
	print("tower coords: %s" % area.global_position)		

	var tower_position := area.global_position - global_position
	var cell_coordinates := Vector2(int(tower_position.x / cell_size.x), int(tower_position.y / cell_size.y))	
	
	area.global_position = global_position + cell_coordinates * cell_size + cell_size / 2
	
