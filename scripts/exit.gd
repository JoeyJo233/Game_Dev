extends Area2D

#@export_file("*.tscn") var path

var path = "res://scenes/word/game02.tscn";

var scene = preload("res://scenes/word/game02.tscn").instantiate()

func _on_body_entered(body: Node2D) -> void:
	print("111")
	Globals.go_to_world(path)