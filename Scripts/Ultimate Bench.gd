extends Area2D

onready var pos = $Position2D
onready var ult_energy = $"1 Ultimate Energy"
onready var interact_prompt = $"Interaction prompt"

var is_interactable = false
const LABEL = preload("res://Scenes/1 Ultimate Energy.tscn")

func _on_Ultimate_Bench_body_entered(body):
	if body.name == "Player":
		is_interactable = true

func _on_Ultimate_Bench_body_exited(body):
	if body.name == "Player":
		is_interactable = false

func _input(event):
	if Input.is_action_just_pressed("Interract") and is_interactable:
		ult_energy.visible = true
		interact_prompt.visible = false
		ult_energy.anim.play("Appear")
		PlayerStats.ultimate += 1
		print(PlayerStats.ultimate)
		is_interactable = false


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
