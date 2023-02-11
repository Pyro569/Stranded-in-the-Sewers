extends Area2D
signal hit

export var speed = 400 #player speed pixels/sec EXPORT KEY ALLOWS TO SET VALUE IN INSPECTOR
var screen_size
var velocity = Vector2.ZERO #player movement vector

func _ready(): #called when node enters scene tree
	screen_size = get_viewport_rect().size



func _process(delta): #function _process is called every frame
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.y > -9.8:
		velocity.y += 0.5 #GRAVITY!!!!!!
		
	if velocity.x > 0:
		velocity.x -= 0.5
	elif velocity.x < 0:
		velocity.x += 0.5 #FRICTION!!!!!
		
	#if velocity.length() > 0:
	#	velocity = velocity.normalized() * speed
	#	$AnimatedSprite.play()
	#else:
	#	$AnimatedSprite.stop()
		
	print("X velocity: " + String(velocity.x))
	print("Y velocity: " + String(velocity.y))

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_Player_body_entered(body):
	hide() #player disappears after being hit
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
