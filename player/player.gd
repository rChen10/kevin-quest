extends KinematicBody2D

# Declare member variables here. Examples:
var direction = "down"
var velocity = Vector2()

var stamina = 100
var player_health = 100

var invul = 0

var turn_count = 0
var moving_counter = 0
const SPEED = 200


var seasharp = false

func update_health():
	if player_health > 0:
		player_health -= 10
		$hp/AnimatedHealth.play(str(player_health))
	
func update_stamina():
	moving_counter += 1
	if moving_counter == 30 and stamina != 0:
		turn_count += 1
		stamina -= 1
		moving_counter = 0

func process_input():
	var moving = Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down")
	if moving and stamina != 0 and player_health != 0:
		update_stamina()
		if Input.is_action_pressed("ui_up") and stamina > 0:
			direction = "up"
			velocity.y = -SPEED
			velocity.x = 0
			$AnimatedSprite.play("walkup")
		elif Input.is_action_pressed("ui_down") and stamina > 0:
			direction = "down"
			velocity.y = SPEED
			velocity.x = 0
			$AnimatedSprite.play("walkdown")
		elif Input.is_action_pressed("ui_right") and stamina > 0:
			direction = "right"
			velocity.x = SPEED
			velocity.y = 0
			$AnimatedSprite.play("walkright")
		elif Input.is_action_pressed("ui_left") and stamina > 0:
			direction = "left"
			velocity.x = -SPEED
			velocity.y = 0
			$AnimatedSprite.play("walkleft")
	else:
		velocity.x = 0
		velocity.y = 0
		if stamina == 0 or player_health == 0:
			$AnimatedSprite.play("game")
			get_node("Camera2D/game_end").visible = true
		else:
			if direction == "up":
				$AnimatedSprite.play("idleback")
			elif direction == "left":
				$AnimatedSprite.play("idleleft")
			elif direction == "right":
				$AnimatedSprite.play("idleright")
			elif direction == "down":
				$AnimatedSprite.play("idlefront")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_end"):
		update_health()
	process_input()
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Chest1" or collision.collider.name == "Chest2" or collision.collider.name == "Chest3" or collision.collider.name == "Chest4": 
			if Input.is_action_pressed("ui_accept"):
				get_parent().get_node(collision.collider.name).chest_open()
		elif collision.collider.name == "Enemy":
			if seasharp == true:
				get_parent().get_node("EnemyPath").visible = false
				get_node("Camera2D/victory").visible = true
			elif invul == 0:
				update_health()
				invul = 20
	if invul > 0:
		invul -= 1
	velocity = move_and_slide(velocity)
	
