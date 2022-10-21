extends Node2D

onready var Healthbar = $TextureProgress2
onready var health_tween = $TextureProgress
onready var tween = $Tween
onready var anim = $TextureProgress/AnimationPlayer
onready var ult_bar = $"Ult Bar"
func _ready():
	Healthbar.value = PlayerStats.player_max_health
	PlayerStats.connect("health_changed", self, "on_health_changed")
	PlayerStats.connect("ultimate_gained", self, "on_ultimate_gained")
	ult_bar.value = 0

func on_health_changed(value):
	Healthbar.value = value
	if value > 20:
		anim.play("Normal")
	else:
		anim.play("Low")
	tween.interpolate_property(health_tween, "value", health_tween.value, PlayerStats.player_health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
	tween.start() 

func on_ultimate_gained(value):
	ult_bar.value = value
