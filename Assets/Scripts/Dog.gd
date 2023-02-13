class_name Dog
extends Player

var finishedCount = 0

func _process(delta):
	if Input.is_action_pressed("move_right2"):
		RightDown = true
	else:
		RightDown = false
	if Input.is_action_pressed("move_left2"):
		LeftDown = true
	else:
		LeftDown = false
	if Input.is_action_pressed("move_up2"):
		UpDown = true
	else:
		UpDown = false
		


