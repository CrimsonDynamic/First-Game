extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -250

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

var coyote_timer = 0.0
var coyote_time = 0.1
var has_jumped = false
var has_double_jumped = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#  Get the input direction: -1,0,1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0 :
		animated_sprite_2d.flip_h = false
	elif direction < 0 :
		animated_sprite_2d.flip_h = true
		
	# Play animations
	if is_on_floor():
		coyote_timer = 0.0
		has_jumped = false
		has_double_jumped = false
		if direction == 0 :
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		coyote_timer += delta
		animated_sprite_2d.play("jump")
	
	if Input.is_action_just_pressed("jump") :
		if coyote_timer < coyote_time and not has_jumped:
			velocity.y = JUMP_VELOCITY
			has_jumped = true
		elif not has_double_jumped:
			velocity.y = JUMP_VELOCITY+50
			has_double_jumped = true
	
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
