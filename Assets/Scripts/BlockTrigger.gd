extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var finishedCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	print(finishedCount)
	if finishedCount >= 3:
		get_tree().change_scene("res://Level2.tscn")
		
#unc _on

func _on_PlayerCollision_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	finishedCount += 1
	
func _on_PlayerCollision_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	finishedCount -= 1
