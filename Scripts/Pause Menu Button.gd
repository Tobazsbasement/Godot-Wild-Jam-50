extends Node2D

onready var anim = $AnimatedSprite

var active = false

func _physics_process(_delta):
	if active == true:
		anim.play("Hover")
	else:
		anim.play("default")



func _on_Button_mouse_entered():
	active = true


func _on_Button_mouse_exited():
	active = false
