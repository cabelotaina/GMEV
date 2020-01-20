extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$RB_Bowl1.connect("body_entered", self, "_on_select_collision")
	$RB_Bowl2.connect("body_entered", self, "_on_select_collision")
	$RB_Bowl3.connect("body_entered", self, "_on_select_collision")
	$RB_Bowl4.connect("body_entered", self, "_on_select_collision")
	$RB_Bowl5.connect("body_entered", self, "_on_select_collision")
	$RB_Bowl6.connect("body_entered", self, "_on_select_collision")
	pass # Replace with function body.

func _on_select_collision(area):
	print("Bowl Collision: ", area.name,' ', self.name)
