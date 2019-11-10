extends Area2D

export (float) var speed = 1
var movement_vector = Vector2(0,-1)

func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Timer.start(2)

func _process(delta):
	self.position += movement_vector * speed 
	
func _set_position(value):
	self.position = value

func _set_scale(scala):
	self.scale = Vector2(scala,scala)
	
func _on_Timer_timeout():
	if self.position.y < -75 or self.position.y > 800:
		print("Eliminando " + self.name)
		self.get_parent().remove_child(self)
		return
	$Timer.start(2)
