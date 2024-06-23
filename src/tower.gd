extends Building

@onready var archer := %Archer as Archer

func _on_detection_area_body_entered(body: Node2D) -> void:
	if not body is Enemy:
		return
		
	archer.start_shooting(body)
