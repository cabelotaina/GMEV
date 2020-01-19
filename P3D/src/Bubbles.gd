extends Spatial

export (float) var speed = 0.002
var movement_vector = Vector3(0, 1, 0)

func _ready():
	$RB_Bubble.connect("body_entered", self, "_on_select_collision")
	$AnimationPlayer.play("default")
	
func _process(delta):
	self.transform.origin += movement_vector * speed 
	
func _set_position(value):
	self.transform.origin = value

func _set_scale(scala):
	self.scale = Vector3(scala, scala, scala)

	
func _on_select_collision(area):
	
	#print("Bubble Collision: ", area.name,' ', self.name)
	
	if area.name.find("Fish") != -1:
		self.visible = false
		self.get_parent().remove_child(area)
		
	if area.name.find("Snail") != -1:
		self.visible = false
		
	if area.name.find("Down limit") != -1:
		speed = 0
		$AnimatedSprite.stop()