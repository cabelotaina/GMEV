extends Light2D


var temperatura

# Called when the node enters the scene tree for the first time.
func _ready():
	self.enabled = false
	temperatura = 0
	self.mode = MODE_ADD

func _input(event):
	if event.is_action("NormalKeyBoard_K"):
		temperatura -=1
		print(temperatura)
		print("energy ", self.energy)
		print(self.color)
		
	elif event.is_action("NormalKeyBoard_J"):
		temperatura+=1
		print(temperatura)
		print("energy", self.energy)
		print(self.color)
		
		
func _process(delta):
	if temperatura > 0:
		self.enabled = true
		self.color = Color("#f70000")
		self.energy = temperatura/10
	elif temperatura < 0:
		self.enabled = true		
		self.color = Color("#00fff3")
		self.energy = -1*temperatura/10
	else:
		self.enabled = false
		