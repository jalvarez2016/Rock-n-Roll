extends Control

@export var health_label : Label

func update_ui(new_health):
	health_label.text = "HP: " + str(new_health) + "/100"
