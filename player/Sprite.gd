extends StaticBody2D

const FACE = Vector2(0, -1)

func chest_open():
	$AnimatedSprite.play("open")