extends Area2D

@export var speed := 20.0

var direction: Vector2

func _process(delta: float) -> void:
	position.x += speed * delta
