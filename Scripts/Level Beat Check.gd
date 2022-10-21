extends Area2D



func _on_Level_Beat_Check_body_entered(body):
	var level = get_parent()
	if body.name == "Player":
		if level.name == "Camp":
			get_tree().quit()
