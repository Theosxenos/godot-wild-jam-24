class_name Hud extends Control

@onready var lbl_gold: Label = %GoldLabel
@onready var lbl_wood: Label = %WoodLabel

func update_resource(name: String, amount: int) -> void:
	if name == "Gold":
		lbl_gold.text = "%s / %s" % [amount, Main.tower_gold_cost]
	elif name == "Wood":
		lbl_wood.text = "%s / %s" % [amount, Main.tower_wood_cost]
