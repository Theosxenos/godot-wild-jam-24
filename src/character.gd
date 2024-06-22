class_name Character extends CharacterBody2D

@export_category("Stats")
@export var speed := 70.0
@export var attack_damage := 1

@export_category("Nodes")
@export var weapon_pivot: Node2D
@export var carry_position := Vector2(0,35)

var carried_object: SpawnableResource

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
