extends Area2D

func _on_Fall_Zone_body_entered(body):
	if body.name == "Player":
		var level = get_parent()
		level.get_tree().reload_current_scene()
