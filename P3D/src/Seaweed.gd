extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$RB_Seaweed.connect("body_entered", self, "_on_select_collision")
	pass # Replace with function body.

func _on_select_collision(area):

	print("Seaweed Collision: ", area.name,' ', self.name)
