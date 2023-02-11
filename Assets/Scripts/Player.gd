extends Area2D
signal hit

export var speed = 400 #player speed pixels/sec EXPORT KEY ALLOWS TO SET VALUE IN INSPECTOR
var screen_size
var velocity = Vector2.ZERO #player movement vector

func _ready(): #called when node enters scene tree
	screen_size = get_viewport_rect().size



func _process(frameLength): #function _process is called every frame, for frameLength (delta) meaning see https://docs.godotengine.org/en/stable/getting_started/first_2d_game/03.coding_the_player.html#preparing-for-collisions:~:text=The%20delta%20parameter%20in%20the%20_process()%20function%20refers%20to%20the%20frame%20length%20%2D%20the%20amount%20of%20time%20that%20the%20previous%20frame%20took%20to%20complete.%20Using%20this%20value%20ensures%20that%20your%20movement%20will%20remain%20consistent%20even%20if%20the%20frame%20rate%20changes.
	
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
		
	print("X velocity: " + String(velocity.x))
	print("Y velocity: " + String(velocity.y))
	print("Framerate: " + String(1/frameLength))

	position += velocity * frameLength
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
