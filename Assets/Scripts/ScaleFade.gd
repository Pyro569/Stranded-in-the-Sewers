extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screensize


# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	var anchorSizeSpot = -(screensize/2)
	self.set_size(screensize)
	self.set_position(anchorSizeSpot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
