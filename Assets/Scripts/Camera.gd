extends Camera2D

export (NodePath) var Cat
export (NodePath) var Dog

var screensize

func _process(delta):
	Cat = get_parent().get_parent().get_node("Players").get_node("Cat").get_node("KinematicBody2D").get_global_position()
	Dog = get_parent().get_parent().get_node("Players").get_node("Dog").get_node("KinematicBody2D").get_global_position()
	#print(Cat.x, " ", Dog.x, " ", ((Cat.x + Dog.x) * 0.5), " ", self.position)
	self.position = ((Cat + Dog) * 0.5)
	screensize = get_viewport_rect().size
	var zoom_factor1 = clamp(abs(Cat.x-Dog.x)/(screensize.x-200), 1, 1000000)
	var zoom_factor2 = clamp(abs(Cat.y-Dog.y)/(screensize.y-200), 1, 1000000)
	var zoom_factor = max(max(zoom_factor1, zoom_factor2), 0.5)
	
	self.zoom = Vector2(zoom_factor, zoom_factor)
