extends Area2D

export (int) var speed = 1 # Exported variable to use in the inspector
var limits
var movement = Vector2(1,0)
# Signal definition
signal must_flip()

func _ready():
	limits = get_viewport().size
	self.connect("must_flip", self, "_on_must_flip")

func _process(delta):
	if speed > 0:
		$AnimatedSprite.play("walk")
		self.position += movement.normalized() * speed
		
		if (self.position.x >= limits.x) || (self.position.x <= 0):
			self.position.x = clamp(self.position.x, 0, limits.x)
			movement = movement * Vector2(-1,0)
			$Sprite.flip_h = not $Sprite.flip_h
	else:
		$AnimatedSprite.play("Idle")

func _on_must_flip():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	movement = movement * Vector2(-1,0)