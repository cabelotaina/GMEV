extends "res://src/Personaje.gd"

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
	self.position += 7 * direction * movement_vector

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

	
	
	