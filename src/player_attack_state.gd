extends PlayerBaseState

@export var hitbox: Area2D

var is_attacking := false

func enter_state() -> void:
	animation_player.animation_finished.connect(attack_animation_finished)

	
func physics_process_state(_delta: float) -> void:
	if is_attacking:
		return
	
	var areas := hitbox.get_overlapping_areas()
	if areas.size() == 0:
		state_machine.switch_state(state_machine.states.IdleState)
		return

	var area := areas[0]
	if not area is Hurtbox:
		return

	if area.is_in_group("woods"):
		animation_player.play("chop")
	else:
		animation_player.play("mine")
	
	is_attacking = true
	
	(area as Hurtbox).take_hit(character.attack_damage)
	
	
func exit_state() -> void:
	if animation_player.animation_finished.is_connected(attack_animation_finished):
		animation_player.animation_finished.disconnect(attack_animation_finished)


func attack_animation_finished(_anim_name: StringName) -> void:
	is_attacking = false
	
	state_machine.switch_state(state_machine.states.IdleState)
