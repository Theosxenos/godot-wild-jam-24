extends Node

# Exported variables for configuration
@export var mob_scene: PackedScene
@export var time_between_waves: float = 5.0
@export var initial_mob_count: int = 5
@export var mob_increase_per_wave: int = 2
@export var min_distance_between_mobs: float = 50.0

# Internal variables
var current_wave: int = 0
var mobs_spawned: int = 0
var spawning: bool = false
var spawn_locations: Array[Vector2]
var spawned_mobs := []

func _ready():
	for c in get_children():
		if c is Marker2D:
			spawn_locations.append(c.global_position)
	
	start_next_wave()

func start_next_wave():
	current_wave += 1
	mobs_spawned = 0
	spawning = true
	print("Wave ", current_wave, " starting with ", initial_mob_count + (mob_increase_per_wave * (current_wave - 1)), " mobs.")
	spawn_mobs(initial_mob_count + (mob_increase_per_wave * (current_wave - 1)))

func spawn_mobs(mob_count: int):
	for i in range(mob_count):
		var mob_instance := mob_scene.instantiate()
		var position := get_random_position()
		while not is_position_valid(position):
			position = get_random_position()
		mob_instance.global_position = position
		add_child(mob_instance)
		spawned_mobs.append(mob_instance)
	spawning = false
	await get_tree().create_timer(time_between_waves).timeout
	start_next_wave()

func get_random_position() -> Vector2:
	return spawn_locations.pick_random()


func is_position_valid(position: Vector2) -> bool:
	for mob in spawned_mobs:
		if mob.global_position.distance_to(position) < min_distance_between_mobs:
			return false
	return true
