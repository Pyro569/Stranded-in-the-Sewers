class_name Cat
extends Player

var finishedCount = 0

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


func _on_BlockTrigger_area_entered(area):
	finishedCount += 1
	print(finishedCount)
	
func _on_BlockTrigger_area_exited(area):
	finishedCount -= 1
	print(finishedCount)
	
	
	
