extends Node2D
onready var anim = $AnimationPlayer

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
