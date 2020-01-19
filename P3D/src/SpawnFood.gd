extends Node2D

const comida = preload("res://Scenes/Comida.tscn")

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("botonIzqRaton"):
		spawn()

func spawn():
	
	var newComida = comida.instance()
	var pos = Vector2()
	var escala = 0.15
	
	pos.x = get_viewport().get_mouse_position().x * 2.25
	print("Mouse, poss", pos.x)
	pos.y = 0
	newComida._set_position(pos)
	newComida._set_scale(escala)
	get_node("container").add_child(newComida)