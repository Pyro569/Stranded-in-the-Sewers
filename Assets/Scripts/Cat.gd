class_name Cat
extends Player

func _process(delta):
	if Input.is_action_pressed("move_right"):
		RightDown = true
	else:
		RightDown = false
	if Input.is_action_pressed("move_left"):
		LeftDown = true
	else:
		LeftDown = false
	if Input.is_action_pressed("move_up"):
		UpDown = true
	else:
		UpDown = false
