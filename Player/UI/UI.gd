extends Control

@export var health_ui : Control

func update_health(new_health):
	health_ui.update_ui(new_health)
