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
		velocity.x = +maxSpeed	
	elif LeftDown:
		velocity.x = -maxSpeed
	elif is_on_floor():
		velocity.x = 0

	if UpDown:
		if is_on_floor():
			velocity.y = - JUMPSPEED
			$AudioStreamPlayer2D.stream = jumpSound
			$AudioStreamPlayer2D.play()
			
	
	velocity.y += GRAVITY
		
	move_and_slide(velocity, FLOOR)
	if is_on_floor():
		velocity.y = 0
		
func _on_BlockTrigger_area_entered(area):
	print("Collided")
	nodePath = get_node("/root/Game/Level/BlockNode/BlockTrigger/RedSquare")
	nodePath.hide()
	
	#print("X Velocity: " + String(velocity.x))
	#print("Y Velocity: " + String(velocity.y))
