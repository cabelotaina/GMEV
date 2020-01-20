extends DirectionalLight

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.light_negative = false
	

func _input(event):
	if event.is_action("NormalKeyBoard_M"):
		self.light_negative = false
	elif event.is_action("NormalKeyBoard_N"):
		self.light_negative = true
		
func _set_light_color(color):
	self.light_color = Color(color)
func _set_visible(value):
	self.visible = value