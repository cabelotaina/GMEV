extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("NormalKeyBoard_K"):
		$UI/K2.visible = false
		$Timer.start(1)
	elif event.is_action_pressed("NormalKeyBoard_J"):
		$UI/J2.visible = false
		$Timer.start(1)		
	elif event.is_action_pressed("NormalKeyBoard_N"):
		$UI/N2.visible = false
		$Timer.start(1)		
	elif event.is_action_pressed("NormalKeyBoard_M"):
		$UI/M2.visible = false
		$Timer.start(1)
		

func _on_Timer_timeout():
	$UI/K2.visible = true
	$UI/J2.visible = true
	$UI/N2.visible = true
	$UI/M2.visible = true
