extends "res://src/Personaje.gd"

func _ready():
	$AnimationPlayer.play("Move01")
	$RB_Snail.connect("body_shape_entered", self, "_on_select_collision")
	#$RB_Fish.connect("body_shape_exited", self, "_on_select_collision")

func move():
	#print(rotation_degrees)
	#print(speed)
	#print(movement_vector)
	#print('t', self.transform)
	#print('gt', self.global_transform)
	self.transform.origin += movement_vector * speed * 0.1
	if rotate:
		self.rotation_degrees.y = int(self.rotation_degrees.y + rotate) % 360
		rotate = 0.0
	else:
		if not isBlocked:
			$AnimationPlayer.play("Move01")

func set_right_movement():
	self.movement_vector = self.movement_vector.cross(Vector3(0, 1, 0))
	self.rotate = -90.0

func set_left_movement():
	self.movement_vector = self.movement_vector.cross(Vector3(0, -1, 0))
	self.rotate = 90.0

func set_up_movement():
	pass
	

func set_down_movement():
	pass

func move_backward():
	$RB_Snail.contacts_reported = 0
	$AnimationPlayer.play("Eat")
	self.movement_vector = -1 * self.movement_vector
	self.rotation_degrees += Vector3(0, 180, 0)
	block($Auto, 3)

func idle(delta):
	pass

func _on_select_collision(body_id, area, body_shape, local_shape):

	print("Snail Collision: ", area.name,' ', self.name)

	if area.name.find("Bowl") != -1:
		move_backward()
		return
		
	if area.name.find("Fish") != -1:
		move_backward()
		return

	if area.name.find("Bubble") != -1:
		area.visible = false

	if area.name.find("Food") != -1:
		area.visible = false
		self._set_scale(self.scale.x + .05)

func _on_timeout_with_recovery():
	self.movement_vector = self.last_direction
	self.rotation_degrees = self.last_rotation
	isBlocked = false
	
func _on_timeout_without_recovery():
	isBlocked = false
	$RB_Snail.contacts_reported = 300000
	if self.rotation_degrees.x or self.rotation_degrees.z:
		reload()
	
func turn_off_all_cameras():
	$Frontal.current = false
	$Lateral.current = false


