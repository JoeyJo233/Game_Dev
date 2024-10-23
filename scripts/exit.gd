extends Area2D

#@export_file("*.tscn") var path

var path = "res://scenes/game.tscn"

var path2 = "res://scenes/game_hidden.tscn"
#var scene = preload("res://scenes/word/game02.tscn").instantiate()

func _on_body_entered(body: Node2D) -> void:
	print("222rrr")
	if Globals.current_level==2:
		if Globals.has_item:
			print("222444")
			Globals.go_to_world(path2)
	else:
		print("222444577")
		Globals.go_to_world(path)
	#pass # Replace with function body.
	#Globals.go_to_world(path)
