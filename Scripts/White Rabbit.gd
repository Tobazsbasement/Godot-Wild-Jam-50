extends KinematicBody2D

onready var sprite = $Sprite

const DIALOGUE = preload("res://Scenes/Dialogue Box.tscn")

var can_interract 
var dialogue
var spawned = false

func _physics_process(delta):
	if !is_instance_valid(dialogue):
		spawned = false

func _on_Left_Detector_body_entered(body):
	sprite.flip_h = true

func _on_Right_Detector_body_entered(body):
	sprite.flip_h = false

func _on_Interaction_prompt_body_entered(body):
	if body.name == "Player":
		can_interract = true

func _on_Interaction_prompt_body_exited(body):
	if body.name == "Player":
		can_interract = false
		if spawned == true:
			dialogue.queue_free()

func _input(event):
	if Input.is_action_just_pressed("Interract"):
		if can_interract and not spawned:
			dialogue = DIALOGUE.instance()
			dialogue.dialoguepath = "res://Assets/Dialogues/Test Dialogue.json"
			get_parent().add_child(dialogue)
			spawned = true

