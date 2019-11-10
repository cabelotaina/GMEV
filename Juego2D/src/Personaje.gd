extends Area2D

export (float) var speed = 0.0
export (bool) var automatic = false
export (bool) var verticalMove = false
export (bool) var horizontalMove = false
export (bool) var isBlocked = false

var movement_vector = Vector2(-1, 0)
var last_direction = Vector2(0, 0)
var context_speed = 0.0
var temperature_object = null

func _ready():
	self.context_speed = self.speed
	self.temperature_object = get_parent().get_node("Temperatura")
	temperature_object.connect("temperatura_changed", self, "_change_speed")

func _process(delta):
	make_a_move(delta)

func make_a_move(delta):
	if automatic:
		automatic_move(delta)
	else:
		move_with_input(delta)

func automatic_move(delta):
	move()

func move_with_input(delta):
	if isBlocked:
		return

	if Input.is_action_pressed("ui_right"):
		set_right_movement()
		move()
	elif Input.is_action_pressed("ui_left"):
		set_left_movement()
		move()
	elif Input.is_action_pressed("ui_up"):
		set_up_movement()
		move()
	elif Input.is_action_pressed("ui_down"):
		set_down_movement()
		move()
	else:
		idle(delta)

func move():
	self.last_direction = self.movement_vector
	self.position += movement_vector * context_speed

func _change_speed():
	
	print("Change temperature " + self.name)
	
	var temperatura = get_temperatura()
	if temperatura == 0:
		self.context_speed = self.speed
	else:
		self.context_speed = self.speed + (self.speed*temperatura) if temperatura > 0 else - self.speed*temperatura/25 
	print(self.context_speed)

func get_temperatura():
	return temperature_object.temperatura
	

func set_right_movement():
	pass

func set_left_movement():
	pass
	
func set_up_movement():
	pass
	
func set_down_movement():
	pass

func move_backward():
	pass
	
func idle(delta):
	pass

func flip():
	pass