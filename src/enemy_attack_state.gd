extends BaseState

var can_attack := true

@onready var attack_rate_timer: Timer = $AttackRateTimer

func enter_state() -> void:
	character.animation_player.animation_finished.connect(animation_finished)
	
	
func exit_state() -> void:
	character.animation_player.animation_finished.disconnect(animation_finished)
	

func physics_process_state(_delta: float) -> void:
	if not can_attack:
		return
	
	character.animation_player.play("attack")
	

func animation_finished(_name: StringName) -> void:
	can_attack = true
