extends Spatial


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
	elif Input.is_key_pressed(KEY_F):
		if activeObj:
			turn_off_all_cameras()
			currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_L):
		if activeObj:
			turn_off_all_cameras()
			currentCamera = activeObj.activate_lateral_camera()
	elif Input.is_key_pressed(KEY_H):
		$Fishbowl/Pecera.get_surface_material(0).albedo_color = Color('#FF0000')
	elif Input.is_key_pressed(KEY_C):
		$Fishbowl/Pecera.get_surface_material(0).albedo_color = Color('#0000FF')
	elif Input.is_key_pressed(KEY_D):
		$Fishbowl/Pecera.get_surface_material(0).albedo_color = Color('#00FF00')
	elif Input.is_key_pressed(KEY_Q):
		if activeObj:
			currentCamera.transform.origin.x += 0.01
	elif Input.is_key_pressed(KEY_W):
		if activeObj:
			currentCamera.transform.origin.x += -0.01
	else:
		pass

func turn_off_all_cameras():
	$SceneCameras/Camera.current = false
	$SceneCameras/Camera2.current = false
	$Fish.turn_off_all_cameras()
	$MoonFish.turn_off_all_cameras()
	$Snail.turn_off_all_cameras()
	
func set_all_automatic():
	$Fish.set_automatic(true)
	$MoonFish.set_automatic(true)
	$Snail.set_automatic(true)

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

