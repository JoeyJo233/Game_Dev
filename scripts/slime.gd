extends CharacterBody2D

const speed = 60
const max_speed = 50
const acceleration = max_speed / 0.2
const gravity = 2
enum Direction {LEFT = -1, RIGHT = 1}

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var direction = Direction.LEFT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	var was_on_wall = is_on_wall()
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.get_normal())

# using move_and_slide
	move_and_slide()
	if is_on_wall() and not was_on_wall:
		direction *= -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	velocity.x = move_toward(velocity.x, max_speed * direction, acceleration * delta)
	velocity.y += gravity * delta
	#if ray_cast_left.is_colliding():
		#direction = 1
		#animated_sprite_2d.flip_h = false
#
	#if ray_cast_right.is_colliding():
		#direction = -1
		#animated_sprite_2d.flip_h = true
	animated_sprite_2d.flip_h = velocity.x > 0
	
	
	position.x += speed * delta * direction
