extends BaseState

func enter_state() -> void:
	player.animation_player.play("walk")
	
	
func physics_process_state(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		state_machine.switch_state(state_machine.states.AttackState)
	else:
		var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		player.direction = direction

		if direction == Vector2.ZERO:
			state_machine.switch_state(state_machine.states.IdleState)
			return

	player.move()
	
