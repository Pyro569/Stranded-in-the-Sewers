extends Camera2D

export (NodePath) var Cat
export (NodePath) var Dog

func _ready():
	position.y = 300

func _process(delta):
	Cat = get_parent().get_parent().get_node("Players").get_node("Cat").get_node("KinematicBody2D").get_global_position()
	Dog = get_parent().get_parent().get_node("Players").get_node("Dog").get_node("KinematicBody2D").get_global_position()
	#print(Cat.x, " ", Dog.x, " ", ((Cat.x + Dog.x) * 0.5))
	self.position = ((Cat + Dog) * 0.5)
