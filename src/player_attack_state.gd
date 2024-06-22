extends PlayerBaseState

@export var hitbox: Area2D


func enter_state() -> void:
	animation_player.animation_finished.connect(attack_animation_finished)

	
func physics_process_state(_delta: float) -> void:
	var areas := hitbox.get_overlapping_areas()
	if areas.size() == 0:
		state_machine.switch_state(state_machine.states.IdleState)
		return

	var area := areas[0]
	if area.is_in_group("woods"):
		animation_player.play("chop")
	else:
		animation_player.play("mine")
	
	
func exit_state() -> void:
	if animation_player.animation_finished.is_connected(attack_animation_finished):
		animation_player.animation_finished.disconnect(attack_animation_finished)


func attack_animation_finished(_anim_name: StringName) -> void:
	state_machine.switch_state(state_machine.states.IdleState)
