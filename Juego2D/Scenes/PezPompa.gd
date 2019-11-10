extends "res://src/Personaje.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AnimatedSprite.frame = randi() % 8