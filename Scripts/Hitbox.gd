extends Area2D

signal being_hurt(area)

func _on_Hitbox_area_entered(area):
	emit_signal("being_hurt", area)
