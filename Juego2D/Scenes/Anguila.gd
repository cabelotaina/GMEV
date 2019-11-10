extends "res://src/Personaje.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AnimatedSprite.play("normal")
	$AnimatedSprite.frame = randi() % 6
	print("Anguila")
	go()
	
	self.connect("area_entered", self, "_on_collision")
	$TurnOffElectricity.connect("timeout", self, "turn_off_electricity")
	$Go.connect("timeout", self, "go")

func set_right_movement():
	$AnimatedSprite.flip_h = true
	self.movement_vector = Vector2(1, 0)


func set_left_movement():
	$AnimatedSprite.flip_h = false
	self.movement_vector = Vector2(-1, 0) * speed
	
func move_backward():
	var direction = 1
	if not $AnimatedSprite.flip_h:
		direction = -1
	self.position += 7 * direction * movement_vector

func idle(delta):
	$AnimatedSprite.play("normal")
	
func flip():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func change_direction():
	movement_vector *= -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

func _on_collision(area):
	#TODO: Comprobar que name contiene 'Bubble'
	print("Eel collision")
	print(area.name)
	if area.name.find("Catfish") != -1:
		$AnimatedSprite.play("electricity")
		$TurnOffElectricity.start(1.2)
		change_direction()

func turn_off_electricity():
	$AnimatedSprite.play("normal")

func go():
	randomize()
	$AnimatedSprite.play("normal")
	var randvar = randi() % 2
	if randvar == 0:
		$AnimatedSprite.flip_h = false
#		self.position.x = 1230
		set_left_movement()
	else:
		$AnimatedSprite.flip_h = true
#		self.position.x = -200
		set_right_movement()

	randvar = randi() % 400
	self.position.y = randvar + 200
	self.position += movement_vector * speed


#	$Go.start(7 + randi() % 25)
