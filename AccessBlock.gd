extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_collision_layer_bit(0, false)
	self.set_collision_mask_bit(0, false)
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _on_KinematicBody2D_Pressed():



func _on_Area2D_area_entered(area):
	self.set_collision_layer_bit(0, true)
	self.set_collision_mask_bit(0, true)
	self.visible = true
