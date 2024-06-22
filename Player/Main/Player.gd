extends CharacterBody2D
class_name Player


@export var health : int = 100
@export var def : int = 5
@export var attack : int = 8
@export var is_player_1 : bool


const SPEED = 45.0
const JUMP_VELOCITY = -400.0

var is_sprinting : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("p1_left", "p1_right", "p1_forward", "p1_back")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y , 0, SPEED)

	move_and_slide()
