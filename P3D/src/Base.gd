extends Node2D


var UI = false
var camera1 = false
var camera2 = true

func _ready():
	$CameraGlobal.current = false
	$CameraGlobal.visible = false
	var camera = $Catfish/CameraCatfish
	camera.current = true
	camera.visible = true

func _process(delta):
	var label = str($Temperatura.temperatura) + "º C"
	$CameraGlobal/TemperaturaLabel.text = label
	$Catfish/CameraCatfish/TemperaturaLabel.text = label
	
	
func _input(event):	
	if event.is_action_pressed("F1_camera1"):
		$CameraGlobal.current = true
		$CameraGlobal.visible = true
		var camera = $Catfish/CameraCatfish
		camera.current = false
		camera.visible = false
		camera2 = not camera1
		camera1 = not camera1
	elif event.is_action_pressed("F2_camera2"):
		$CameraGlobal.current = false
		$CameraGlobal.visible = false
		var camera = $Catfish/CameraCatfish
		camera.current = true
		camera.visible = true
		camera2 = not camera1
		camera1 = not camera1
	elif event.is_action_pressed("F3_UI"):
		if UI == false:
			$CameraGlobal/UI.visible = false
			$Catfish/CameraCatfish/UI.visible = false
		else:
			$CameraGlobal/UI.visible = true
			$Catfish/CameraCatfish/UI.visible = true
		UI = not UI
	elif event.is_action_pressed("NormalKeyBoard_K"):
		if $Temperatura.temperatura < -10:
			$spawn_bubbles.frecuenciaS = 2
		else:
			$spawn_bubbles.frecuenciaS = 1
	elif event.is_action_pressed("NormalKeyBoard_J"):
		if $Temperatura.temperatura > 25:
			$spawn_bubbles.frecuenciaS =  0.2
		else: 
			$spawn_bubbles.frecuenciaS = 1
		
func create_bubbles():
	pass