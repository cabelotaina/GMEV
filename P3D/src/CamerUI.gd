extends Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("NormalKeyBoard_K"):
		$K2.visible = false
		$Timer.start(1)
	elif event.is_action_pressed("NormalKeyBoard_J"):
		$J2.visible = false
		$Timer.start(1)		
	elif event.is_action_pressed("NormalKeyBoard_N"):
		$N2.visible = false
		$Timer.start(1)		
	elif event.is_action_pressed("NormalKeyBoard_M"):
		$M2.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_0):
		$"0".visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_9):
		$"9".visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_1):
		$"1".visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_2):
		$"2".visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_3):
		$"3".visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_F):
		$F.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_L):
		$L.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_H):
		$H.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_C):
		$C.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_D):
		$D.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_Q):
		$Q.visible = false
		$Timer.start(1)
	elif Input.is_key_pressed(KEY_W):
		$W.visible = false
		$Timer.start(1)
		

func _on_Timer_timeout():
	$"0".visible = true
	$"9".visible = true
	$"1".visible = true
	$"2".visible = true
	$"3".visible = true
	$F.visible = true
	$L.visible = true
	$H.visible = true
	$K2.visible = true
	$J2.visible = true
	$N2.visible = true
	$M2.visible = true
	$W.visible = true
	$Q.visible = true
	$D.visible = true
	$C.visible = true

func _set(property, value):
	property = value