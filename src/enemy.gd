class_name Enemy extends Character

#@export var speed := 90.0
@onready var state_machine: StateMachine = $StateMachine

func _on_hitbox_body_entered(body: Node2D) -> void:
	state_machine.switch_state(state_machine.states.AttackState)
