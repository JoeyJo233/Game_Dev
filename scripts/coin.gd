extends Area2D

@onready var game_manager: Node = %gameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_body_entered(_body: Node2D) -> void:
	queue_free()
