extends PlayerState

func enter():
	player.velocity.x = lerp(player.velocity.x, 0, player.friction)

func exit():
	pass

func physics_update(delta):
	if not player.is_on_floor():
		if player.velocity.y > 0:
			state_machine.transition_to("Fall")
			return
	
	player.apply_gravity(delta)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("Jump"):
		state_machine.transition_to("Jump")
	elif Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		state_machine.transition_to("Walk")
