extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var SPEED = 130.0
const JUMP_VELOCITY = -300.0
var jump_max = 0
var jump_count = 0
var dash_count = 0

var dash_speed = 600
var dash_duration = 0.2
var is_dashing = false
var dash_time = 0
var first_time = true


# Fixed frequency operation default 60 times/second
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else: 
		jump_count = 0
		dash_count = 0
		
	if Globals.current_level == 2 && first_time:
		first_time = false
		jump_max = 1

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count <= jump_max:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	
	if Input.is_action_just_pressed("dash"):
		is_dashing = true
		dash_time = dash_duration
	var direction := Input.get_axis("move_left", "move_right")	
	
	if is_dashing:
		# handle dash
		dash_time -= delta
		if dash_time <= 0:
			is_dashing = false
		else:
			velocity.x = direction * dash_speed
			velocity.x = move_toward(velocity.x, 0, SPEED)
			move_and_slide()
	else:	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		
		
	# Handle sprite flipping based on movement direction
		if direction > 0:
			animated_sprite_2d.flip_h = false
		elif direction < 0:
			animated_sprite_2d.flip_h = true
	
	# Play the appropriate animation based on movement state
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("idle")
			else:
				animated_sprite_2d.play("run")
		elif jump_count == 1:
			animated_sprite_2d.play("jump1")
		elif jump_count == 0:
			animated_sprite_2d.play("jump1")
		else: 
			animated_sprite_2d.play("jump2")
		
	# Set horizontal velocity based on input direction
		if direction != 0:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()
