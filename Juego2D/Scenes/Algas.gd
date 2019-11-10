extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AnimatedSprite.frame = randi() % 5
	self.connect("area_entered", self, "_collide_catfish")
	$Timer.connect("timeout", self, "_on_Timer_timeout")

func _collide_catfish(area):
	print("Alga collision")
	print(area.name)
	$AnimatedSprite.speed_scale = 5
	$Timer.start(2)
	
func _on_Timer_timeout():
	$AnimatedSprite.speed_scale = 1
