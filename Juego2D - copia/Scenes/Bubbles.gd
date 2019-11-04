extends Area2D

export (float) var speed = 1
var movement_vector = Vector2(0,-1)

func _ready():
	pass # Replace with function body.

func _process(delta):
	self.position += movement_vector * speed 
	
func _set_position(value):
	self.position = value

func _set_scale(scala):
	self.scale = Vector2(scala,scala)