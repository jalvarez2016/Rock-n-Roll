extends CharacterBody2D
class_name Player

@export var controls : Resource = null
@export var health : int = 100
@export var defense : int = 1
@export var attack : int = 8
@export var UI_manager : Control



const SPEED = 45.0
const JUMP_VELOCITY = -400.0

var is_sprinting : bool = false


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector(controls.left, controls.right, controls.forward, controls.back)
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y , 0, SPEED)

	move_and_slide()


func damage(attack_damage : int):
	if (attack_damage - defense > 0): 
		health -= attack_damage - defense
		UI_manager.update_health(health)
		print('player health: ', health)
	else:
		#do vfx that no damage was done
		pass
