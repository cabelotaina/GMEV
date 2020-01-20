extends Spatial

export (String) var objStr;
 
const food = preload("res://scenes/Food.tscn")

var obj;

func _ready():
	obj = load("res://scenes/"+ objStr +".tscn")
	$Timer.connect("timeout", self, "_spawn")
	randomize()

func remove_child(ch):
	get_node("Container").remove_child(ch)

func _spawn():
	var newObj = obj.instance()
	var escala = .4
	var randomx = rand_range(-25, 25)
	var randomz = rand_range(-25, 25)
	#print(Vector3(randomx, 0, randomz))
	newObj._set_position(Vector3(randomx, -75, randomz))
	newObj._set_scale(escala)
	get_node("Container").add_child(newObj)