extends StaticBody2D

var opened = false

func _process(delta):
	if get_parent().get_node("Player").velocity.x != 0 or get_parent().get_node("Player").velocity.y != 0:
		$ChestMessage1.visible = false

func chest_open():
	if opened == false:
		$AnimatedSprite.play("open")
		$ChestMessage1.visible = true
		get_parent().get_node("Player").stamina += 45
		opened = true
		
