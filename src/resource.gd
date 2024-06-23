class_name SpawnableResource extends Area2D

var _character: Character

func _process(_delta: float) -> void:
	if _character:
		global_position = _character.global_position - _character.carry_position


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Press e to pick up")


func pickup(character: Character) -> void:
	_character = character
	# z_index = 5
	$CollisionShape2D.set_deferred("disabled", true)


func drop(position: Vector2) -> void:
	_character = null
	global_position = position
	# z_index = 0
	$CollisionShape2D.set_deferred("disabled", false)
