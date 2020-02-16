extends RichTextLabel



func _process(delta):
	set_text("Stamina: "+str(get_parent().get_parent().stamina))

