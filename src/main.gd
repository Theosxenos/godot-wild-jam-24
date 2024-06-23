class_name Main extends Node

static var tower_gold_cost := 3
static var tower_wood_cost := 3

@onready var hud: Hud = %Hud as Hud
@onready var storage := %Storage as Storage

func update_hud(resource_name: String, total_amount: int) -> void:
	hud.update_resource(resource_name, total_amount)
