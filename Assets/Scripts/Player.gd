class_name Player
extends KinematicBody2D

signal Pressed

const GRAVITY = 17
const JUMPSPEED = 700
const FLOOR = Vector2(0, -1)

var velocity = Vector2.ZERO

var maxSpeed = 350

var RightDown = false
var LeftDown = false
var UpDown = false


var nodePath

var jumpSound = preload("res://Assets/Sounds/jump.wav")

func _process(delta):
	#print(position.y)
	if position.y > 10000:
		position.y = 0
	if position.x < -10000:
		position.x = 10000
	if position.x > 10000:
		position.x = -10000

func _physics_process(delta):
	if RightDown:
		if velocity.x < maxSpeed:
			velocity.x += 10
	elif LeftDown:
		if velocity.x > -maxSpeed:
			velocity.x -= 10
	elif is_on_floor():
		if velocity.x < 0:
			velocity.x += 20
		if velocity.x > 0:
			velocity.x -= 30

	if UpDown:
		if is_on_floor():
			velocity.y = - JUMPSPEED
			$AudioStreamPlayer2D.stream = jumpSound
			$AudioStreamPlayer2D.play()
			
	
	velocity.y += GRAVITY
		
	move_and_slide(velocity, FLOOR)
	if is_on_floor():
		velocity.y = 0
	if is_on_wall():
		velocity.x = 0
	if is_on_ceiling():
		velocity.y = 0
		
	
	#print("X Velocity: " + String(velocity.x))
	#print("Y Velocity: " + String(velocity.y))

