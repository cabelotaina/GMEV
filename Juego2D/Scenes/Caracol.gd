extends Area2D

export (float) var speedIni = 0.3 # Exported variable to use in the inspector
var limits
var movement = Vector2(0,0)
# Signal definition
signal must_flip()
var randomInt 
var speed = 0

func _ready():
	limits = get_viewport().size
	self.connect("must_flip", self, "_on_must_flip")

func _process(delta):
	if speed > 0:
		if Input.is_action_pressed("ui_right"):
			if not $AnimatedSprite.is_flipped_h():
				$AnimatedSprite.flip_h = true
			movement = Vector2(1,0)
		elif Input.is_action_pressed("ui_left"):
			if $AnimatedSprite.is_flipped_h():
				$AnimatedSprite.flip_h = false
			movement = Vector2(-1,0)
		self.position = self.position + movement.normalized() * speed
		$AnimatedSprite.play("Walk")

		if (self.position.x - $Position2D.position.x*self.scale.x >= limits.x) || (self.position.x + $Position2D.position.x*self.scale.x<= 0):
			$Timer.start(3)
			self.position.x = clamp(self.position.x, 0, limits.x)
			movement = movement * Vector2(-1,0)
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	else:
		$AnimatedSprite.play("Idle")
		if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
			speed = speedIni


func _on_must_flip():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	movement = movement * Vector2(-1,0)
	

func _on_Timer_timeout():
	$AnimatedSprite.play("Idle")
	$Timer.stop()
	speed = 0
	