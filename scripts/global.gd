extends Node
 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func reload_word():
	animation_player.play_backwards("fade-in");
	await(animation_player.animation_finished) 
	get_tree().reload_current_scene()
	animation_player.play("fade-in")



func _animate_transition_to(path):
	animation_player.play_backwards("fade-in")
	await(animation_player.animation_finished)
	get_tree().change_scene(path)
	animation_player.play("fade-in")
