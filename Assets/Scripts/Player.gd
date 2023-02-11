class_name Player
extends KinematicBody2D

const GRAVITY = 20
const JUMPSPEED = 700
const FLOOR = Vector2(0, -1)

var velocity = Vector2.ZERO

var maxSpeed = 300

var RightDown = false
var LeftDown = false
var UpDown = false

func _process(delta):
	#print(position.y)
	if position.y > 1000:
		position.y = 0
	if position.x < -700:
		position.x = 1000
	if position.x > 1000:
		position.x = -700
		

func _physics_process(delta):
	if RightDown:
		velocity.x = +maxSpeed	
	elif LeftDown:
		velocity.x = -maxSpeed
	elif is_on_floor():
		velocity.x = 0

	if UpDown:
		if is_on_floor():
			velocity.y = - JUMPSPEED
			
	
	velocity.y += GRAVITY
		
	move_and_slide(velocity, FLOOR)
	if is_on_floor():
		velocity.y = 0
	
	#print("X Velocity: " + String(velocity.x))
	#print("Y Velocity: " + String(velocity.y))
