extends Camera2D

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("NormalKeyBoard_K"):
		$UI/K.visible = false
		$Timer.start(1)
	elif event.is_action_pressed("NormalKeyBoard_J"):
		$UI/J.visible = false
		$Timer.start(1)		
	elif event.is_action_pressed("NormalKeyBoard_N"):
		$UI/N.visible = false
		$Timer.start(1)		
	elif event.is_action_pressed("NormalKeyBoard_M"):
		$UI/M.visible = false
		$Timer.start(1)
		

func _on_Timer_timeout():
	$UI/K.visible = true
	$UI/J.visible = true
	$UI/N.visible = true
	$UI/M.visible = true
