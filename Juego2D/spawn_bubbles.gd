extends Node2D

const bubbles = preload("res://Scenes/Bubbles.tscn")
export (float) var r_margin = 0
export (float) var l_margin = 0
export (float) var frecuenciaS = 0.5

func _ready():
	$Timer.autostart = true
	$Timer.wait_time = frecuenciaS
	$Timer.start()
	
	
func spawn():
	
	var newBubble = bubbles.instance()
	var pos = Vector2()
	pos.x = rand_range(l_margin,r_margin)
	pos.y = 0
	newBubble._set_position(pos)
	var escala = randf() * 2
	newBubble._set_scale(escala)
	get_node("container").add_child(newBubble)
	

func _on_Timer_timeout():
	spawn()