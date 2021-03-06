extends "res://src/Personaje.gd"

var speedOld = 0

func _ready():
	print("Caracol")
	self.connect("area_entered", self, "_on_collision")
	set_left_movement()

func set_right_movement():
	$AnimatedSprite.flip_h = true
	self.movement_vector = Vector2(1, 0)
	$AnimatedSprite.play("Walk")

func set_left_movement():
	$AnimatedSprite.flip_h = false
	self.movement_vector = Vector2(-1, 0)
	$AnimatedSprite.play("Walk")
	
func move_backward():
	var direction = 1
	if not $AnimatedSprite.flip_h:
		direction = -1
	#self.position += 7 * direction * movement_vector

func idle(delta):
	$AnimatedSprite.play("Idle")
	
func flip():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func change_direction():
	movement_vector *= -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func _on_collision(area):
	#TODO: Comprobar que name contiene 'Bubble'
	print("Caracol collision")
	print(area.name)
	if area.name.find("limit") != -1:
		change_direction()
	if area.name.find("Comida") != -1:
		area.visible = false
		area.get_parent().remove_child(area)
		$AnimatedSprite.play("Idle")
		speedOld = movement_vector
		movement_vector = Vector2(0,0)
		$Timer.start(2)
		if scale.x < 1:
			self.scale.x += 0.05
			self.scale.y += 0.05
	

func _on_Timer_timeout():
	$AnimatedSprite.play("Walk")
	if $AnimatedSprite.flip_h == true:
		movement_vector = Vector2(1,0)
	else:
		movement_vector = Vector2(-1,0)
		