extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screensize


# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	self.set_size(screensize)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
