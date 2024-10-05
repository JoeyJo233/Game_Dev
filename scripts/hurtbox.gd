extends Area2D

signal hurt

func _on_Hurtbox_hurt():
	queue_free()
