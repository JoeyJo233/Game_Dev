extends Node2D

var speed: float = 80.0  # 宠物的跟随速度
var fast_speed: float = 130.0
var normal_speed: float = 90.0 
var follow_distance: float = 50.0  # 宠物与玩家之间的最小距离
var min_distance_to_stop: float = 10.0  # 宠物与玩家之间的最小停止距离，避免宠物抽动
var far_distance_threshold: float = 70.0  # 远距离加速的触发距离
@onready var player: CharacterBody2D = $"../player"  # 确保路径正确

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


# 每帧更新
func _process(delta: float):
	if player:
		# 计算玩家左上角和右上角的目标点
		var left_top_target = player.global_position + Vector2(-40, -5)  # 玩家左上角偏移5,5像素
		var right_top_target = player.global_position + Vector2(40, -5)  # 玩家右上角偏移5,5像素

		# 计算宠物到两个点的距离
		var distance_to_left = global_position.distance_to(left_top_target)
		var distance_to_right = global_position.distance_to(right_top_target)

		# 选择距离最近的目标点
		var target_position: Vector2
		if distance_to_left < distance_to_right:
			target_position = left_top_target
		else:
			target_position = right_top_target

		# 计算宠物与目标点之间的距离
		var distance_to_target = global_position.distance_to(target_position)

		# 当距离足够大时才让宠物移动
		if distance_to_target > min_distance_to_stop:
			# 计算跟随方向并进行移动
			if distance_to_target > far_distance_threshold: #如果离得很远，出发run
				# 当距离大于120时，提升速度到130，并切换动画为"run"
				speed = fast_speed
				sprite.play("run")
			else:
				speed = normal_speed
				sprite.play("idle")
			var direction = global_position.direction_to(target_position).normalized()
			var velocity = direction * speed * delta
			global_position += velocity

			# 根据移动方向调整Sprite的朝向
			if player.position.x >=  position.x:
				sprite.flip_h = true  # 向右移动时翻转
			else:
				sprite.flip_h = false  # 向左移动时不翻转
		else:
			# 当宠物距离玩家足够近时，不动
			global_position = global_position  # 保持位置不变
