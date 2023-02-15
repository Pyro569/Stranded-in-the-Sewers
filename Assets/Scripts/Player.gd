class_name Player
extends PlayerGroup

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

func respawn():
	position.y = 0
	position.x = 0

func _process(delta):
	#print(position.y)
	if position.y > 10000:
		respawn()
	elif position.x < -10000:
		respawn()
	elif position.x > 10000:
		respawn()

func _physics_process(delta):
	if RightDown:
		if velocity.x < maxSpeed:
			velocity.x += 10
	elif LeftDown:
		if velocity.x > -maxSpeed:
			velocity.x -= 10
	elif is_on_floor():
		if velocity.x < 0:
			if velocity.x <= 50:
				velocity.x += 50
			elif velocity.x <= 10:
				velocity.x += 10
		elif velocity.x > 0:
			if velocity.x >= 50:
				velocity.x -= 50
			elif velocity.x >= 10:
				velocity.x -= 10

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

