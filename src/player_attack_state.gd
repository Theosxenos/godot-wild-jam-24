extends PlayerBaseState

@export var hitbox: Area2D
var collision_shape: CollisionShape2D

func _ready() -> void:
	super._ready()
	collision_shape = hitbox.get_node("CollisionShape2D")

func enter_state() -> void:
	collision_shape.disabled = false
	
	var areas := hitbox.get_overlapping_areas()
	if areas.size() == 0:
		state_machine.switch_state(state_machine.states.IdleState)
		return
	
	var area := areas[0]
	if area.is_in_group("woods"):
		animation_player.play("chop")
	else:
		animation_player.play("mine")
	
	animation_player.animation_finished.connect(attack_animation_finished)
	
	
func exit_state() -> void:
	collision_shape.disabled = true
	if animation_player.animation_finished.is_connected(attack_animation_finished):
		animation_player.disconnect("animation_finished", attack_animation_finished)


func attack_animation_finished(anim_name: StringName) -> void:
	
	state_machine.switch_state(state_machine.states.IdleState)
	print(anim_name)
	
