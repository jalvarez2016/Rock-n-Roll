extends Area2D

@export var enemy : Enemy = null
@export var attack_timer : Timer = null

var player : Player = null

func _on_area_entered(area):
	if area.is_in_group("Player"):
		player = area.player
		player.damage(enemy.attack)
		attack_timer.start(0.6)


func _on_area_exited(area):
	if area.is_in_group("Player"):
		player = null
		attack_timer.stop()


func _on_attack_timer_timeout():
	if player:
		player.damage(enemy.attack)
		print('attack timer ran out')
		
