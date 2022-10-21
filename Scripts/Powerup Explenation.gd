extends CanvasLayer


onready var label = $Label
onready var anim = $AnimationPlayer

func _on_Timer_timeout():
	anim.play("Fade Out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade Out":
		queue_free()
