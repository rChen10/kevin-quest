extends StaticBody2D

var talked_to = false

func _process(delta):
	if get_parent().get_node("Player").velocity.x != 0 or get_parent().get_node("Player").velocity.y != 0:
		$ChatMessage1.visible = false

func interact():
	if talked_to == false:
		$ChatMessage1.visible = true
		get_parent().get_node("Player").stamina /= 2
		talked_to = true
		
		
	elif talked_to == true:
		$ChatMessage2.visible = true
		get_parent().get_node("Player").player_health = 10
		get_parent().get_node("Player").update_health()
		
		
