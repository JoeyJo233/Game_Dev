extends Area2D

signal hit

func _on_area_entered(hurtbox) -> void:
	emit_signal("hit")
	hurtbox.emit_signal("hurt")
