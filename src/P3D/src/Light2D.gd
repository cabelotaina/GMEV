extends Light2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.enabled = true
	

func _input(event):
	if event.is_action("NormalKeyBoard_M"):
		self.mode = MODE_ADD
	elif event.is_action("NormalKeyBoard_N"):
		self.mode = MODE_SUB
		