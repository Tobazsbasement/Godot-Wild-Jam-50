extends StaticBody2D

onready var hitbox = $Hitbox

func _ready():
	hitbox.connect("being_hurt", self, "take_damage")

func take_damage(area):
	var attacking = area.get_parent()
	
	if attacking.name == "Player":
		queue_free()
