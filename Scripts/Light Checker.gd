extends Area2D

var in_light = false

onready var predators = $Predators
onready var predator_filter = $CanvasLayer/Sprite

func _on_Light_Checker_body_entered(body):
	if body.name == "Player":
		in_light = true

func _on_Light_Checker_body_exited(body):
	in_light = false

func _on_Timer_timeout():
	if in_light:
		predators.visible = true
		predator_filter.visible = true
		predators.modulate.a += 0.005
		predator_filter.modulate.a += 0.005


func _on_Timer2_timeout():
	if in_light == false and predators.modulate.a > 0:
		predators.modulate.a -= 0.1
	if in_light == false and predator_filter.modulate.a > 0:
		predator_filter.modulate.a -= 0.1
