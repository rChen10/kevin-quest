extends KinematicBody2D

# Declare member variables here. Examples:
var direction = "down"
var velocity = Vector2()

var stamina = 100
var turn_count = 0
var moving_counter = 0
const SPEED = 200

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var moving = Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down")
	if moving:
		moving_counter += 1
		if moving_counter == 30:
			turn_count += 1
			stamina -= 1
			moving_counter = 0
			
		if Input.is_action_pressed("ui_up"):
			direction = "up"
			velocity.y = -SPEED
			velocity.x = 0
			$AnimatedSprite.play("walkup")
		elif Input.is_action_pressed("ui_down"):
			direction = "down"
			velocity.y = SPEED
			velocity.x = 0
			$AnimatedSprite.play("walkdown")
			
		if Input.is_action_pressed("ui_right"):
			direction = "right"
			velocity.x = SPEED
			velocity.y = 0
			$AnimatedSprite.play("walkright")
		elif Input.is_action_pressed("ui_left"):
			direction = "left"
			velocity.x = -SPEED
			velocity.y = 0
			$AnimatedSprite.play("walkleft")
	else:
		velocity.x = 0
		velocity.y = 0
		
	if moving == false:
		if direction == "up":
			$AnimatedSprite.play("idleback")
		elif direction == "left":
			$AnimatedSprite.play("idleleft")
		elif direction == "right":
			$AnimatedSprite.play("idleright")
		elif direction == "down":
			$AnimatedSprite.play("idlefront")
			
	velocity = move_and_slide(velocity)