extends Node

var player_max_health = 100
var max_ultimate = 5
onready var player_health = player_max_health setget set_health
onready var ultimate = 0 setget set_ultimate
var player_jump_count = 1
var double_jump_unlocked = false

signal health_changed(value)
signal no_health
signal ultimate_gained(value)

func _ready():
	player_health = player_max_health

func set_health(value):
	player_health = value
	emit_signal("health_changed", player_health)
	if player_health == 0:
		emit_signal("no_health")

func set_ultimate(value):
	if ultimate < max_ultimate:
		ultimate = value
		emit_signal("ultimate_gained", value)
