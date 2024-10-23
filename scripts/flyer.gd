extends CharacterBody2D


var speed: float = 80.0  # 宠物的跟随速度

var far_distance_threshold: float = 200.0  # 远距离加速的触发距离
@onready var player: CharacterBody2D = $"../../player"  # 确保路径正确
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

# 每帧更新
func _process(delta: float):
	if player:
		
		# 留着
		# 计算宠物与目标点之间的距离
		var distance_to_target = global_position.distance_to(player.global_position)
	
		# 计算跟随方向并进行移动
		if distance_to_target < far_distance_threshold: #如果离得很远，出发run
			# 当距离大于120时，提升速度到130，并切换动画为"run"
			
			sprite.play("run")
			
			var direction = global_position.direction_to(player.global_position).normalized()
			var velocity = direction * speed * delta
			global_position += velocity
			

			# 根据移动方向调整Sprite的朝向
			if player.position.x >=  position.x:
				sprite.flip_h = true  # 向右移动时翻转
			else:
				sprite.flip_h = false  # 向左移动时不翻转
		else:
			#
			# 当宠物距离玩家足够远时，不动
			global_position = global_position  # 保持位置不变
