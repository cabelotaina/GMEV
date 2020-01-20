extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	$RB_Seaweed.connect("body_entered", self, "_on_select_collision")
	$Timer.connect("timeout", self, "_on_timeout")


func _on_select_collision(area):
	print("Seaweed Collision: ", area.name,' ', self.name)
	
	$AnimationPlayer.play("GrowingR01")
	$Timer.start(3)

func _on_timeout():
	$AnimationPlayer.play("NormalWave01")

