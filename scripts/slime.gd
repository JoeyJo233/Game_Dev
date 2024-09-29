extends CharacterBody2D

const speed = 10
const max_speed = 10
const acceleration = max_speed / 0.2
const gravity = 2
enum Direction {LEFT = -1, RIGHT = 1}

const GRAVITY = 200


var WALK_SPEED = 50
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var direction = Direction.LEFT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#velocity = velocity.slide(collision.get_normal())
func _physics_process(delta: float) -> void:
	var was_on_wall = is_on_wall()
	velocity.y += delta * GRAVITY
# "move_and_slide" already takes delta time into account.
	move_and_slide()
	
	if is_on_wall() and not was_on_wall:
		print("111")
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


func _on_hurtbox_hurt() -> void:
	print("444")
	if animation_player.has_animation("reset"):
		print("22")
		animation_player.play("reset") 
	else:
		print("223")
		queue_free()
