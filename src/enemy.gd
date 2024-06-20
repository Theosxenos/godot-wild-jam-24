class_name Enemy extends CharacterBody2D

@export var speed := 90.0

func _ready() -> void:
	velocity = Vector2.LEFT * speed
	
	
func _physics_process(_delta: float) -> void:
	move_and_slide()
