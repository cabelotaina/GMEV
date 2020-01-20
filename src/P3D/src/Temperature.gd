extends Spatial

signal temperatura_changed

export (int) var temperatura

func _ready():
#	$Temperatura.enabled = false
#	$BowlFishLight.negative = false
	$BowlFishLight._set_light_color('#ffffff')
	temperatura = 0

func _input(event):
	if event.is_action_pressed("NormalKeyBoard_K"):
		if temperatura >= -24:
			temperatura -=1
			emit_signal("temperatura_changed")
	elif event.is_action_pressed("NormalKeyBoard_J"):
		if temperatura < 50:
			temperatura+=1
			emit_signal("temperatura_changed")

func _process(delta):
	if temperatura > 0:
		$BowlFishLight._set_visible(true)		
		$BowlFishLight._set_light_color("#f70000")
	elif temperatura < 0:
		$BowlFishLight._set_visible(true)		
		$BowlFishLight._set_light_color("#00fff3")		
	else:
		$BowlFishLight._set_visible(false)
		
	get_parent().get_node("SceneCameras")._set_temperature(str(temperatura) + "º C")
	
	
	