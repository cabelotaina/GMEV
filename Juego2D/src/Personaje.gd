
extends Area2D

export (float) var speed = 0.0
export (bool) var automatic = false
export (bool) var verticalMove = false
export (bool) var horizontalMove = false

var movement_vector = Vector2(-1,0)

func _ready():
	var right = get_parent().get_node("Right limit")
	var left = get_parent().get_node("Left limit")
	right.connect("area_entered", self, "_on_fishbowl_area_entered")
	left.connect("area_entered", self, "_on_fishbowl_area_entered")

func _process(delta):
	move(delta)

func move(delta):
	if automatic:
		automatic_move(delta)
	else:
		move_with_input(delta)

func automatic_move(delta):
	move_left(delta)

func move_with_input(delta):

	if Input.is_action_pressed("ui_right"):
		move_right(delta)
	elif Input.is_action_pressed("ui_left"):
		move_left(delta)
	elif Input.is_action_pressed("ui_up"):
		move_up(delta)
	elif Input.is_action_pressed("ui_down"):
		move_down(delta)
	else:
		idle(delta)
	#self.position = self.position + movement.normalized() * speed
	#$AnimatedSprite.play("Walk")

func _on_fishbowl_area_entered(area):
	print("Exit")
	
	if area.name != self.name:
		return
	
	if automatic:
		print("auto")
		movement_vector *= -1
	else: 
		move_backward()

func move_right(delta):
	pass

func move_left(delta):
	pass
	
func move_up(delta):
	pass
	
func move_down(delta):
	pass

func move_backward():
	pass
	
func idle(delta):
	pass

func flip():
	pass
