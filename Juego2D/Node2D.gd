extends Node2D

export (int) var speed = 1 # Exported variable to use in the inspector
var limits
var movement = Vector2(1,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal must_flip()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	self.connect("must_flip", self, "_on_must_flip")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$Caracol.play("WALK")
	if (self.position.x >= limits.x) || (self.position.x <= 0):
		emit_signal("must_flip")
	
	self.position += movement.normalized() * speed
		
func _on_must_flip():
#	$Caracol/CaracolMove/AnimatedSprite.flip_h = not $Caracol/CaracolMove/AnimatedSprite.flip_h
#	movement = movement * Vector2(-1,0)
	pass
