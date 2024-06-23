extends StaticBody2D


func _on_drop_area_area_entered(area: Area2D) -> void:
	if not area is SpawnableResource:
		return
	
	var resource := area as SpawnableResource
	var anim_player := resource.get_node("AnimationPlayer") as AnimationPlayer
	anim_player.play("spawn", -1, -1.3, true)
	await anim_player.animation_finished
	resource.queue_free()
