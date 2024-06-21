class_name Player extends CharacterBody2D

@export var speed := 70.0

var direction: Vector2

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

func move() -> void:
	sprite_2d.flip_h = true if direction.x < 0 else false
	velocity = direction * speed
	move_and_slide()
