extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_1.tscn")
	
	


func _on_quit_pressed() -> void:
	get_tree().quit()
