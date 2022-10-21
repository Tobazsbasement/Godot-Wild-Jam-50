extends Control

onready var preview = $AnimatedSprite
onready var continue_button = $Continue
onready var options_button = $Options
onready var credits_button = $Credits
onready var quit_button = $Quit
onready var preview_text = $Label
onready var credits = $"Credit Background"
onready var options = $"Options Background"

onready var is_paused = false setget set_paused
onready var credits_visible = false setget credit_visibilty
onready var options_visible = false setget options_visibility
func _input(event):
	if Input.is_action_just_pressed("Pause"):
		self.is_paused = !is_paused
		self.credits_visible = false
		self.options_visible = false
	if is_paused == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _physics_process(delta):
	if continue_button.active == true:
		preview.visible = true
		preview.play("Continue")
		preview_text.text = "Resume gameplay"
	elif options_button.active == true:
		preview.visible = true
		preview.play("Options")
		preview_text.text = "Review options"
	elif credits_button.active == true:
		preview.visible = true
		preview.play("Credits")
		preview_text.text = "View the credits"
	elif quit_button.active == true:
		preview.visible = true
		preview.play("Quit")
		preview_text.text = "Exit game"
	else:
		preview.visible = false
		preview_text.text = ""

func set_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Continue_Button_pressed():
	self.is_paused = false
	self.credits_visible = false
	self.options_visible = false

func _on_Quit_Button_pressed():
	get_tree().quit()
	self.credits_visible = false
	self.options_visible = false

func credit_visibilty(value):
	credits.visible = value

func _on_Options_Button_pressed():
	self.credits_visible = false
	self.options_visible = true

func _on_Credits_Button_pressed():
	self.credits_visible = true
	self.options_visible = false

func options_visibility(value):
	options.visible = value
