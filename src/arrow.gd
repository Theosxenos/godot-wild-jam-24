class_name Arrow extends Area2D

@export var damage := 1
@export var max_range := 300
@export var speed := 200.0

var current_distance := 0.0
var direction: Vector2

func _ready() -> void:
	rotation = direction.angle()

func _process(delta: float) -> void:
	current_distance += speed * delta
	if current_distance > max_range:
		queue_free()
	
	position += direction * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if not area is Hurtbox:
		return
	
	(area as Hurtbox).take_hit(damage)
	queue_free()
