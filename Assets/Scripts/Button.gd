extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var isPaused = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	self.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("pause"):
		if isPaused == 0:
			self.visible = true
			isPaused = 1
		else:
			self.visible = false
			isPaused = 0

func _pressed():
	print("title")
	get_tree().change_scene("res://TitleScreen.tscn")
