class_name Character extends CharacterBody2D

@export var speed := 70.0
@export var weapon_pivot: Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

func move(direction: Vector2) -> void:
	velocity = direction * speed
	
	flip(direction)
	move_and_slide()
	
	
func flip(direction: Vector2) -> void:
	if direction.x != 0:
		var facing_left := direction.x < 0
		sprite_2d.flip_h = facing_left
		
		if weapon_pivot:
			weapon_pivot.rotation_degrees = 180 if facing_left else 0
