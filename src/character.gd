class_name Character extends CharacterBody2D

@export var speed := 70.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

func move(direction: Vector2) -> void:
	if direction.x != 0:
		sprite_2d.flip_h = direction.x < 0
	velocity = direction * speed
	move_and_slide()
