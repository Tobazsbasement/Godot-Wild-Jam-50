extends KinematicBody2D
class_name Player

onready var sprite = $Character

var acceleration = 15000
var max_speed = 10000
var friction = 0.6
var gravity = 2500
var jump = 1800
var velocity = Vector2.ZERO
var sprint = false

func _input(event):
	if Input.is_action_pressed("Sprint"):
		sprint = true
	if Input.is_action_just_released("Sprint"):
		sprint = false

func apply_gravity(delta):
	velocity.y += gravity * delta
