extends Area2D

export (float) var speed = 1
var movement_vector = Vector2(0,1)

func _ready():
	self.connect("area_entered", self, "_on_collision")
	
func _process(delta):
	self.position += movement_vector * speed 
	
func _set_position(value):
	self.position = value

func _set_scale(scala):
	self.scale = Vector2(scala,scala)

	
func _on_collision(area):
	#TODO: Comprobar que name contiene 'Bubble'
	print("ComidaCollision: ", area.name)
	if area.name.find("Catfish") != -1:
		pass
	if area.name.find("Snail") != -1:
		self.visible = false
	if area.name.find("Caracol") != -1:
		self.visible = false
	if area.name.find("Down limit") != -1:
		speed = 0
		$AnimatedSprite.stop()