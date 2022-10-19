extends Area2D

onready var fade_anim = $"Fade Anim"
onready var float_anim = $"Float Anim"

func _ready():
	float_anim.play("Floating")

func _on_Interaction_prompt_body_entered(body):
	visible = true
	fade_anim.play("Fade In")


func _on_Interaction_prompt_body_exited(body):
	fade_anim.play("Fade Out")


func _on_Fade_Anim_animation_finished(anim_name):
	if anim_name == "Fade Out":
		visible = false
