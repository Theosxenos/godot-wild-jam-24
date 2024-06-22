extends BaseState

func enter_state() -> void:
	character.animation_player.play("walk")
	
func physics_process_state(_delta: float) -> void:
	character.move(Vector2.LEFT)
