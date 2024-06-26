class_name Archer extends CharacterBody2D

@export var arrow_scene: PackedScene

var current_target: Enemy
var targets: Array[Enemy] = []

var is_shooting := false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var arrow_position: Marker2D = $ArrowPosition

func _process(_delta: float) -> void:
	if targets.size() == 0 and not current_target:
		if not animation_player.is_playing():
			animation_player.play("idle")
		return
	
	if is_shooting:
		return
		
	if current_target:
		if not is_instance_valid(current_target):
			current_target = null
		else:
			animation_player.play("shoot")
	else:
		while targets.size() > 0:
			current_target = targets.pop_front()
			if is_instance_valid(current_target):
				break
		if not is_instance_valid(current_target):
			current_target = null


func start_shooting(target: Enemy) -> void:
	if is_instance_valid(target):
		targets.append(target)


func stop_shooting() -> void:
	animation_player.play("idle")

	
func shoot() -> void:
	if not current_target or not is_instance_valid(current_target):
		return
	
	is_shooting = true
	var arrow := arrow_scene.instantiate() as Arrow
	arrow.direction = arrow_position.global_position.direction_to(current_target.global_position)
	
	arrow_position.add_child(arrow)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name != "shoot":
		return
	
	is_shooting = false
