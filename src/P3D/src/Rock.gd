extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	$RB_Rock.connect("body_entered", self, "_on_select_collision")

func _on_select_collision(area):
	print("Rock Collision: ", area.name,' ', self.name)


