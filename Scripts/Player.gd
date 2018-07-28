extends KinematicBody2D

const WALK_SPEED = 150
const JUMP_SPEED = 150
const GRAVITY = 100
const MAX_Y_VELOCITY = 200

var velocity = Vector2()

func _physics_process(delta):
	CheckWalking()
	CheckJumping(delta)
	
	move_and_slide(velocity)

func _process(delta):
	if Input.is_action_pressed("move_hide"):
		visible = false
	
	if Input.is_action_just_released("move_hide"):
		visible = true

func CheckWalking():
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = WALK_SPEED
	
	if velocity.x < 0:
		velocity.x += 5
	elif velocity.x > 0:
		velocity.x -= 5

func CheckJumping(delta):
	if Input.is_action_just_pressed("move_jump"):
		if velocity.y == 0:
			velocity.y = -JUMP_SPEED
	
	if velocity.y != 0:
		velocity.y += delta * GRAVITY
	if velocity.y > MAX_Y_VELOCITY:
		velocity.y = 0