extends Node
 
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var current_level = 1

func reload_word():
	animation_player.play_backwards("fade-in");
	await(animation_player.animation_finished) 
	get_tree().reload_current_scene()
	animation_player.play("fade-in")



func go_to_world(path):
	#animation_player.play_backwards("fade-in")
	#await(animation_player.animation_finished)
	get_tree().change_scene_to_file(path)
	#get_tree().change_scene_to(path)
	#animation_player.play("fade-in")
