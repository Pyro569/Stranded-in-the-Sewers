extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var physics = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	print(position)
	if physics:
		print(self.get_parent().get_node("Death").position.y - self.position.y)

func _on_Death_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Box entered")
	physics = true

func _on_Death_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print("Box exited")
	physics = false
