extends CharacterBody2D

var speed = 50
var acceleration = 7
var player : Player = null

@onready var nav_agent : NavigationAgent2D = $NavigationAgent2D

func _process(delta):
	var direction = Vector2.ZERO
	
	if player:
		nav_agent.target_position = player.global_position
	direction = nav_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	move_and_slide()

func _on_detection_area_entered(area):
	if area.is_in_group("Player"):
		nav_agent.target_position = area.player.global_position
		player = area.player


func _on_detection_area_exited(area):
	player = null
	pass # Replace with function body.
