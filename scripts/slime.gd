extends CharacterBody2D

const speed = 60

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var raycast: RayCast2D = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var direction = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast.enabled = false  # 启用 RayCast
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	## 检查是否在地面上
	#if is_on_floor():
		#position.x += speed * delta * direction
		#if ray_cast_left.is_colliding():
			#direction *= -1
			#animated_sprite_2d.flip_h = false
		#if ray_cast_right.is_colliding():
			#direction *= -1
			#animated_sprite_2d.flip_h = true
	#else:
		#direction *= -1
		#animated_sprite_2d.flip_h = true
		#position.x += speed * delta * direction
	#
	#move_and_slide()
	pass
	
		
