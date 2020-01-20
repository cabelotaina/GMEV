extends Spatial

var UI = false;
var activeObj = null;
var currentCamera = null;
var temperatura = 0.5;

func _ready():
	#print('MAAAAAAIN')
	change_temperature()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_0):
		turn_off_all_cameras()
		set_all_automatic()
		$SceneCameras/Camera.current = true
		currentCamera = $SceneCameras/Camera
		activeObj = null
	elif Input.is_key_pressed(KEY_9):
		turn_off_all_cameras()
		set_all_automatic()
		$SceneCameras/Camera2.current = true
		currentCamera = $SceneCameras/Camera2
		activeObj = null
	elif Input.is_key_pressed(KEY_1):
		turn_off_all_cameras()
		activeObj = $Fish
		activeObj.set_automatic(false)
		currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_2):
		turn_off_all_cameras()
		activeObj = $MoonFish
		activeObj.set_automatic(false)
		currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_3):
		turn_off_all_cameras()
		activeObj = $Snail
		activeObj.set_automatic(false)
		currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_4):
		turn_off_all_cameras()
		activeObj = $Eel
		activeObj.set_automatic(false)
		currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_F):
		if activeObj:
			turn_off_all_cameras()
			currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_L):
		if activeObj:
			turn_off_all_cameras()
			currentCamera = activeObj.activate_lateral_camera()
	elif Input.is_key_pressed(KEY_M):
		$Temperatura/BowlFishLight._set_negative(false)
	elif Input.is_key_pressed(KEY_N):
		$Temperatura/BowlFishLight._set_negative(true)
	elif Input.is_key_pressed(KEY_H):
		$Fishbowl/Pecera.get_surface_material(0).albedo_color = Color('#FF0000')
	elif Input.is_key_pressed(KEY_C):
		$Fishbowl/Pecera.get_surface_material(0).albedo_color = Color('#0000FF')
	elif Input.is_key_pressed(KEY_D):
		$Fishbowl/Pecera.get_surface_material(0).albedo_color = Color('#00FF00')
	elif Input.is_key_pressed(KEY_Q):
		if activeObj:
			if currentCamera.name.find("Frontal") != -1:
				currentCamera.transform.origin.z += 0.01
			else:
				currentCamera.transform.origin.x += 0.01
	elif Input.is_key_pressed(KEY_W):
		if activeObj:
			if currentCamera.name.find("Frontal") != -1:
				currentCamera.transform.origin.z -= 0.01
			else:
				currentCamera.transform.origin.x -= 0.01
	elif Input.is_key_pressed(KEY_F3):
		if UI == false:
			$Fish/Frontal/"0".visible = false
			$Fish/Frontal/"9".visible = false
			$Fish/Frontal/"1".visible = false
			$Fish/Frontal/"2".visible = false
			$Fish/Frontal/"3".visible = false
			$Fish/Frontal/"4".visible = false
			$Fish/Frontal/F.visible = false
			$Fish/Frontal/L.visible = false
			$Fish/Frontal/H.visible = false
			$Fish/Frontal/K2.visible = false
			$Fish/Frontal/J2.visible = false
			$Fish/Frontal/N2.visible = false
			$Fish/Frontal/M2.visible = false
			$Fish/Frontal/F3.visible = false
			$Fish/Frontal/W.visible = false
			$Fish/Frontal/Q.visible = false
			$Fish/Frontal/D.visible = false
			$Fish/Frontal/C.visible = false
		else:
			$Fish/Frontal/"0".visible = true
			$Fish/Frontal/"9".visible = true
			$Fish/Frontal/"1".visible = true
			$Fish/Frontal/"2".visible = true
			$Fish/Frontal/"3".visible = true
			$Fish/Frontal/"4".visible = true
			$Fish/Frontal/F.visible = true
			$Fish/Frontal/L.visible = true
			$Fish/Frontal/H.visible = true
			$Fish/Frontal/K2.visible = true
			$Fish/Frontal/J2.visible = true
			$Fish/Frontal/N2.visible = true
			$Fish/Frontal/M2.visible = true
			$Fish/Frontal/F3.visible = true
			$Fish/Frontal/W.visible = true
			$Fish/Frontal/Q.visible = true
			$Fish/Frontal/D.visible = true
			$Fish/Frontal/C.visible = true
		UI = not UI
	else:
		pass

func turn_off_all_cameras():
	$SceneCameras/Camera.current = false
	$SceneCameras/Camera2.current = false
	$Fish.turn_off_all_cameras()
	$MoonFish.turn_off_all_cameras()
	$Snail.turn_off_all_cameras()
	$Eel.turn_off_all_cameras()

	
func set_all_automatic():
	$Fish.set_automatic(true)
	$MoonFish.set_automatic(true)
	$Snail.set_automatic(true)
	$Eel.set_automatic(true)

func change_temperature():
	pass

func decrease_temperature():
	if temperatura >= -24:
		temperatura -= 1.0
		change_temperature()
		
func increase_temperature():
	if temperatura < 50:
		temperatura += 1.0
		change_temperature()

