extends "res://src/Personaje.gd"

func _ready():
	$AnimatedSprite.play("Idle")
	self.connect("area_entered", self, "_on_bubbles")
	$Timer.connect("timeout", self, "_on_timeout")

func move():
	self.last_direction = self.movement_vector
	self.position += movement_vector * speed

func set_right_movement():
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.flip_h = false
	self.movement_vector = Vector2(1, 0)
	$AnimatedSprite.play("MoveRight")

func set_left_movement():
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.flip_h = true
	self.movement_vector = Vector2(-1, 0)
	$AnimatedSprite.play("MoveRight")

func set_up_movement():
	$AnimatedSprite.flip_v = false
	self.movement_vector = Vector2(0, -1)
	$AnimatedSprite.play("MoveUp")

func set_down_movement():
	$AnimatedSprite.flip_v = true
	self.movement_vector = Vector2(0, 1)
	$AnimatedSprite.play("MoveUp")

func move_backward():
	self.position += -50 * last_direction

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
	print("Catfish collision")
	print(area.name)

	if area.name.find("limit") != -1:
		move_backward()
		return

	if area.name.find("@Bubble") != -1:
		area.visible = false
		take_a_hit()

	if area.name.find("Algas") != -1:
		return
		
	if area.name.find("Anguila") != -1:
		take_a_hit()
		return

func take_a_hit():
	$AnimatedSprite.play("Collide")
	$AnimatedSprite.flip_v = true
	isBlocked = true
	$Timer.start(.7)
	return
	
func _on_timeout():
	$AnimatedSprite.flip_v = false
	$AnimatedSprite.play("Idle")
	isBlocked = false

