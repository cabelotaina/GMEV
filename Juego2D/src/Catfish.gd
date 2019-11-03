extends "res://src/Personaje.gd"

var last_direction = Vector2(0, 0)

func _ready():
	$AnimatedSprite.play("Idle")
	self.connect("area_entered", self, "_on_bubbles")
	$Timer.connect("timeout", self, "_on_timeout")

func move_right(delta):
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("MoveRight")	
	self.position -= movement_vector * speed
	self.last_direction = Vector2(1, 0)

func move_left(delta):
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("MoveRight")	
	self.position += movement_vector * speed
	self.last_direction = Vector2(-1, 0)
	
func move_up(delta):
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.play("MoveUp")	
	self.position -= Vector2(0, 1) * speed
	self.last_direction = Vector2(0, -1)
	
func move_down(delta):
	$AnimatedSprite.flip_v = true
	$AnimatedSprite.play("MoveUp")	
	self.position += Vector2(0, 1) * speed
	self.last_direction = Vector2(0, 1)

func move_backward():
	#print(self.position)
	self.position += -50 * last_direction
	#print(self.position)

func idle(delta):
	$AnimatedSprite.flip_v = false
	if self.last_direction.x + self.last_direction.y < 0:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Idle")
	
func flip():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func _on_bubbles(area):
	#TODO: Comprobar que name contiene 'Bubble'
	print("Bubbleeeee")
	area.visible = false
	$AnimatedSprite.play("Collide")
	$AnimatedSprite.flip_v = true
	isBlocked = true
	$Timer.start(.7)
	
func _on_timeout():
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.play("Idle")
	isBlocked = false

