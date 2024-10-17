extends Area2D

@onready var player: CharacterBody2D = $"../player" 



func _on_body_entered(body: Node2D) -> void:
	if player:
		player.jump_max = 1
		queue_free()
		
	
