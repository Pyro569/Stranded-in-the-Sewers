extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var finishedCount = 0
var finishing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_parent().get_parent().get_parent().get_node("Fadeout/ColorRect").visible = true
	self.get_parent().get_parent().get_parent().get_node("Fadeout/ColorRect").modulate.a8 = 0

func _process(delta):
	if finishing:
		self.get_parent().get_parent().get_parent().get_node("Fadeout").position.x = self.get_parent().get_parent().get_parent().get_node("Camera/Camera2D").position.x
		self.get_parent().get_parent().get_parent().get_node("Fadeout").position.y = self.get_parent().get_parent().get_parent().get_node("Camera/Camera2D").position.y
	if finishedCount >= 2:
		finishing = true
		finishedCount = 0
		var i = 0
		self.get_node("Triple/AnimatedSprite").play("default")
		while i != 255:
			self.get_parent().get_parent().get_parent().get_node("Fadeout/ColorRect").modulate.a8 += 1
			i += 1
			yield(get_tree().create_timer(0.01),"timeout")
		get_tree().change_scene("res://Level4.tscn")
		
#unc _on

func _on_PlayerCollision_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(area.name == "BlockTrigger"):
		finishedCount += 1

func _on_PlayerCollision_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if(area.name == "BlockTrigger"):
		finishedCount -= 1

