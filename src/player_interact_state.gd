extends BaseState

@export var interact_area: Area2D

func enter_state() -> void:
	var carried_object := character.carried_object
	if carried_object:
		carried_object.drop(character.global_position)
		character.carried_object = null
		state_machine.switch_state(state_machine.states.IdleState)
		return
	
	var areas := interact_area.get_overlapping_areas()
	var resources := areas.filter(func(a): return a is SpawnableResource) #as Array[SpawnableResource]
	
	if resources.size() == 0:
		state_machine.switch_state(state_machine.states.IdleState)
	else:
		character.carried_object = areas[0]
		character.carried_object.pickup(character)
		state_machine.switch_state(state_machine.states.CarryIdleState)
	
	
		
	
		
