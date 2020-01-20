extends Spatial

export (float) var speed = 0.0
export (bool) var automatic = false
var yOriginal = 0

var isBlocked = false
var movement_vector = Vector3(0, 0, 1)
var last_direction = Vector3(0, 0, 1)
var last_rotation = Vector3(0, 0, 0)
var context_speed = 0.01
var temperature_object = null

#new
var rotate = 0

func _ready():
	$Recov.connect("timeout", self, "_on_timeout_with_recovery")
	$Auto.connect("timeout", self, "_on_timeout_without_recovery")
	randomize()
	###self.temperature_object = get_parent().get_node("Temperatura")
	###temperature_object.connect("temperatura_changed", self, "_change_speed")

func _process(delta):
	#print(self.transform.origin)
	make_a_move(delta)

func make_a_move(delta):
	if automatic:
		automatic_move(delta)
	else:
		move_with_input(delta)

func automatic_move(delta):
	#print('AUTO')

	if isBlocked:
		move()
		return

	var dec = rand_range(0,100)
	
	if dec < 5:
		set_up_movement()
	elif dec < 10:
		set_down_movement()
	elif dec < 30:
		set_right_movement()
	elif dec < 50:
		set_left_movement()
	else:
		pass

	block($Auto, 5)
	move()

func move_with_input(delta):
	#print('CONTROL')

	if isBlocked:
		move()
		return

	if Input.is_action_just_released("ui_right"):
		set_right_movement()
	elif Input.is_action_just_released("ui_left"):
		set_left_movement()
	elif Input.is_action_just_released("ui_up"):
		set_up_movement()
		block($Recov, 2)
	elif Input.is_action_just_released("ui_down"):
		set_down_movement()
		block($Recov, 2)
	else:
		pass

	move()

func move():
	self.last_direction = self.movement_vector
	self.position += movement_vector * context_speed
	
func prepare_block():
	self.last_direction = self.movement_vector
	self.last_rotation = self.rotation_degrees
	
func block(Timer, segs):
	isBlocked = true
	Timer.start(segs)


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

func set_automatic(isAutomatic):
	self.automatic = isAutomatic

func activate_lateral_camera():
	$Lateral.current = true
	return $Lateral

func activate_frontal_camera():
	$Frontal.current = true
	return $Frontal

func _set_position(value):
	self.transform.origin = value

func _set_scale(scala):
	self.scale = Vector3(scala, scala, scala)
	
func reload():
	self.movement_vector = Vector3(0, 0, 1)
	self.last_direction = Vector3(0, 0, 1)
	self.rotation_degrees = Vector3.ZERO

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