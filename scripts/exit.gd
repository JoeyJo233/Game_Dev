@tool
extends Area2D

@export_file("*.tscn") var path

func _on_body_entered(body: Node2D) -> void:
	Globals.go_to_world(path)
	#pass # Replace with function body.
	
