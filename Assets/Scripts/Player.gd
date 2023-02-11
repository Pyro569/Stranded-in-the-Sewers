extends KinematicBody2D

const GRAVITY = 20
const JUMPSPEED = 700
const FLOOR = Vector2(0, -1)

var velocity = Vector2.ZERO

var maxSpeed = 300

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = +maxSpeed	
	elif Input.is_action_pressed("move_left"):
		velocity.x = -maxSpeed
	elif is_on_floor():
		velocity.x = 0

	
	if Input.is_action_pressed("move_up"):
		if is_on_floor():
			velocity.y = - JUMPSPEED	
	
	velocity.y += GRAVITY
		
	move_and_slide(velocity, FLOOR)
