extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var pushed = false

func _process(delta):
	print(position, pushed)
	if position.y < -218 and pushed:
		position.y += 1
	if position.y > -1017 and not pushed:
		position.y -= 1

func _on_Area2D_area_entered(area):
	pushed = true


func _on_Area2D_area_exited(area):
	pushed = false
