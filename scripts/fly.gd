extends CharacterBody2D

const gravity = 2000
const MAX_SPEED = 120.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_sensor: Area2D = $PlayerSensor


@export var max_speed: int = 50
@export var acceleration  = 50 / 0.2
@export var is_dead = false

var target_position = null

func _process(delta: float) -> void:
	if is_dead:
		velocity.x=0
		velocity.y += gravity * delta
	else:
		var bodies = player_sensor.get_overlapping_bodies()
		#玩家不在视野范围内， velocity慢慢变成0
		if bodies.is_empty:
			velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
		else:
			#冲着玩家的方向去
			var direction = global_position.direction_to(bodies[0].global_position)
			velocity = velocity.move_toward(direction * max_speed, acceleration * delta)			
			#空中单位立马转身 slime 需要改变方向
			animated_sprite_2d.flip_h = direction.x > 0
			
func _physics_process(delta: float) -> void:
	move_and_slide()
	

func _calc_target_position():
	# 停到玩家所在位置
	var bodies = player_sensor.get_overlapping_bodies()
	if not bodies.empty():
		return bodies[0].global_position
			
	if target_position != null and global_position.distance_squared_to(target_position) < 25:			
		return null
			
	return target_position	
