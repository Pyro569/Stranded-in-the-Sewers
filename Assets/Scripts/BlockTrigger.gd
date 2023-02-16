extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var finishedCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if !get_tree().get_current_scene().get_name() == "Level5":
		self.get_parent().get_parent().get_parent().get_node("Camera/Camera2D/Fadeout/ColorRect").visible = true
		self.get_parent().get_parent().get_parent().get_node("Camera/Camera2D/Fadeout/ColorRect").modulate.a8 = 0

func _process(delta):
	var input = "whopper"
	if get_tree().get_current_scene().get_name() == "Level5":
		input = get_parent().get_parent().get_node("Level/Whopper").text
		print(finishedCount, input)
	if finishedCount >= 2 and input.to_lower() == "whopper":
		if get_tree().get_current_scene().get_name() == "Level5":
			get_tree().change_scene("res://Win.tscn")
		else:
			finishedCount = 0
			var i = 0
			self.get_node("Triple/AnimatedSprite").play("default")
			while i != 255:
				self.get_parent().get_parent().get_parent().get_node("Camera/Camera2D/Fadeout/ColorRect").modulate.a8 += 1
				i += 1
				yield(get_tree().create_timer(0.01),"timeout")
			if get_tree().get_current_scene().get_name() == "Game":
				get_tree().change_scene("res://Level2.tscn")
			elif get_tree().get_current_scene().get_name() == "Level2":
				get_tree().change_scene("res://Level3.tscn") 
			elif get_tree().get_current_scene().get_name() == "Level3":
				get_tree().change_scene("res://Level4.tscn") 
			elif get_tree().get_current_scene().get_name() == "Level4":
				get_tree().change_scene("res://Level5.tscn") 
#unc _on

func _on_PlayerCollision_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print(area.name)
	if(area.name == "BlockTrigger"):
		finishedCount += 1

func _on_PlayerCollision_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print(area.name)
	if(area.name == "BlockTrigger"):
		finishedCount -= 1
