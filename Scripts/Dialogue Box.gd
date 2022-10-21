extends Node2D

onready var timer = $Timer
onready var text = $RichTextLabel
onready var label = $Sprite
export var dialoguepath = ""
export var text_speed = 0.016

var dialogue
var phrase_num = 0
var finished = false
var can_show_up = true
var spawned = false

func _ready():
	timer.wait_time = text_speed
	dialogue = get_dialogue()
	assert(dialogue, "Dialogue not found")
	nextphrase()
	spawned = false

func _physics_process(delta):
	label.visible = finished

func _input(event):
	if can_show_up == true:
		if Input.is_action_just_pressed("Interract"):
			if finished:
				nextphrase()
			else:
				text.visible_characters = len(text.text)

func get_dialogue() -> Array:
	var file = File.new()
	assert(file.file_exists(dialoguepath), "File not found")
	
	file.open(dialoguepath, File.READ)
	var json = file.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output 
	else:
		return[]

func nextphrase():
	if phrase_num >= len(dialogue):
		queue_free()
		spawned = false
		return
	
	finished = false
	
	text.bbcode_text = dialogue[phrase_num]["Text"]
	
	text.visible_characters = 0
	
	while text.visible_characters < len(text.text):
		text.visible_characters += 1
		
		timer.start()
		yield(timer, "timeout")
	
	finished = true
	phrase_num += 1
	return
