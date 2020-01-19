extends Spatial


var activeObj = null;
var currentCamera = null;

func _ready():
	#print('MAAAAAAIN')
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
	elif Input.is_key_pressed(KEY_F):
		if activeObj:
			turn_off_all_cameras()
			currentCamera = activeObj.activate_frontal_camera()
	elif Input.is_key_pressed(KEY_L):
		if activeObj:
			turn_off_all_cameras()
			currentCamera = activeObj.activate_lateral_camera()
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
	#$MoonFish.turn_off_all_cameras()
	
func set_all_automatic():
	$Fish.set_automatic(true)
	#$MoonFish.set_automatic(true)

