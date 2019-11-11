extends Node2D

signal temperatura_changed

export (int) var temperatura

func _ready():
	$Temperatura.enabled = false
	temperatura = 0
	$Temperatura.mode = Light2D.MODE_ADD

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
		$Temperatura.enabled = true
		$Temperatura.color = Color("#f70000")
		$Temperatura.energy = temperatura/10
	elif temperatura < 0:
		$Temperatura.enabled = true		
		$Temperatura.color = Color("#00fff3")
		$Temperatura.energy = -1*temperatura/10
	else:
		$Temperatura.enabled = false
	$RichTextLabel.text = str(temperatura) + "º C"
	
