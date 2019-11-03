extends "res://src/Personaje.gd"

func _ready():
	$AnimatedSprite.play("Idle")

func move_right(delta):
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Walk")	
	self.position -= movement_vector * speed

func move_left(delta):
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("Walk")	
	self.position += movement_vector * speed
	
func move_up(delta):
	pass
	
func move_down(delta):
	pass

func move_backward():
	var direction = 1
	if not $AnimatedSprite.flip_h:
		direction = -1
	self.position += 7 * direction * movement_vector

func idle(delta):
	$AnimatedSprite.play("Idle")
	
func flip():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func change_direction():
	movement_vector *= -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

