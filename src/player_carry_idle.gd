extends BaseState

func enter_state() -> void:
	character.animation_player.play("carry_idle")


func input_state(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		state_machine.switch_state(state_machine.states.InteractState)
	else:
		var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if direction != Vector2.ZERO:
			state_machine.switch_state(state_machine.states.CarryMoveState)

			
func exit_state() -> void:
	pass
