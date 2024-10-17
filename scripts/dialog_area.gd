extends Node2D

@export var dialogId = 1

var is_player_in_area: bool = false  # 标记玩家是否在Area2D内

# 当有物体进入Area2D时触发
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":  # 检查进入区域的是否是玩家
		is_player_in_area = true  # 玩家进入区域，设置为 true
		print("Player entered the area")

# 当物体离开Area2D时触发
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":  # 检查离开区域的是否是玩家
		is_player_in_area = false  # 玩家离开区域，设置为 false
		print("Player exited the area")
		

# 每帧调用，持续检查按键输入
func _process(delta: float) -> void	:	
	if is_player_in_area and Input.is_action_just_pressed("q"):  # 检查是否按下了Q键
			DialogicManager.start_dialog_by_id(dialogId)
			
   #continue_dialog()  # 推进对话

	
