extends Area2D

var interractable = false
var player = null
const HOW_TO = preload("res://Scenes/Powerup Explenation.tscn")

func _on_Super_Jump_body_entered(body):
	if body.name == "Player":
		interractable = true
		player = body

func _input(event):
	if interractable:
		if Input.is_action_just_pressed("Interract"):
				PlayerStats.double_jump_unlocked = true
				var how_to = HOW_TO.instance()
				get_parent().add_child(how_to)
				queue_free()


func _on_Super_Jump_body_exited(body):
	if body.name == "Player":
		PlayerStats.double_jump_unlocked = true
		interractable = false
		player = null
