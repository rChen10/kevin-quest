extends Area2D


func _ready():
	connect("body_entered", self, "_area_entered")
	connect("body_exited", self, "_area_exited")


func _area_entered(object):
	handle_open_chest()

func _area_exited(object):
	pass


func handle_open_chest():
	pass