extends KinematicBody2D

const WALK_SPEED = 150
const JUMP_SPEED = 150
const GRAVITY = 100

var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = WALK_SPEED
	
	if velocity.x < 0:
		velocity.x += 5
	elif velocity.x > 0:
		velocity.x -= 5
	
	if Input.is_action_just_pressed("move_jump"):
		velocity.y = -JUMP_SPEED
	
	velocity.y += delta * GRAVITY
	
	move_and_slide(velocity)