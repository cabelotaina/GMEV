
extends Area2D

export (float) var speed = 0.0
export (bool) var automatic = false
export (bool) var verticalMove = false
export (bool) var horizontalMove = false
export (bool) var isBlocked = false

var movement_vector = Vector2(-1, 0)
var last_direction = Vector2(0, 0)

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
	self.position += movement_vector * speed

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

