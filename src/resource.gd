class_name SpawnableResource extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Press e to pick up")
