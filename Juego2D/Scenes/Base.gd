extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var UI = false
var camera1 = false
var camera2 = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$CameraGlobal.current = false
	$CameraGlobal.visible = false
	var camera = $Catfish/CameraCatfish
	camera.current = true
	camera.visible = true

func _process(delta):
	pass
	
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
		print("UIT", UI)
		
		if UI == false:
			if camera1 == true:
				$CameraGlobal/UI.visible = true
			elif camera2 == true:
				$Catfish/CameraCatfish/UI.visible = true
		UI = not UI
		print("UIT", UI)
			
func create_bubbles():
	pass