extends CharacterBody2D

#const gravity = 2000

@export var gravity = 2000
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_sensor: Area2D = $PlayerSensor


var max_speed: int = 50
var acceleration  = 50 / 0.2
@export var is_dea: bool = false

var target_position = null

func _process(delta: float) -> void:
	print(is_dea)
	if is_dea:
		print(" dead")
		velocity.x = 0
		velocity.y += gravity * delta
	else:
		print("444")
		var bodies = player_sensor.get_overlapping_bodies()
		#玩家不在视野范围内， velocity慢慢变成0
		if bodies.is_empty():
			print("4446")
			velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
		else:
			print("4445")
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



func _on_hurtbox_hurt() -> void:
	print("555")
	animation_player.play("death")
