extends "res://src/Personaje.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	self.connect("area_entered", self, "_on_collision")
	$AnimatedSprite.frame = randi() % 8
	
func _on_collision(area):
	#TODO: Comprobar que name contiene 'Bubble'
	print("PezPompa collision")
	print(area.name)
	if area.name.find("Catfish") != -1:
		$AnimatedSprite.play("Asustado")
		$Timer.start(2)
	if area.name.find("limit") != -1:
		change_direction()
	
func change_direction():
	movement_vector *= -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func _on_Timer_timeout():
	$AnimatedSprite.play("Normal")
