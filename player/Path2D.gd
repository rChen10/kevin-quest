extends Path2D

onready var following = get_node("PathFollow2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
func _process(delta):
	following.set_offset(following.get_offset() + 400 * delta)
