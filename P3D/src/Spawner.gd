extends Spatial

export (String) var objStr;
 
const food = preload("res://scenes/Food.tscn")

var obj;

func _ready():
	obj = load("res://scenes/"+ objStr +".tscn")
	$Timer.connect("timeout", self, "_spawn")
	randomize()

func _spawn():
	var newObj = obj.instance()
	var escala = .1
	var randomx = rand_range(-self.scale.x/2, self.scale.x/2)
	var randomz = rand_range(-self.scale.z/2, self.scale.z/2)
	#print(Vector3(randomx, 0, randomz))
	newObj._set_position(Vector3(randomx, 0, randomz))
	newObj._set_scale(escala)
	get_node("Container").add_child(newObj)