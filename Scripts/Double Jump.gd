extends PlayerState

func enter():
	player.velocity.y -= player.double_jump_power


func exit():
	pass

func physics_update(delta):
	if player.velocity.y > 0:
		state_machine.transition_to("Fall")
		return
	
	var input_direction_x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	player.velocity.x = input_direction_x * player.acceleration * delta
	player.velocity.x = clamp(player.velocity.x, -player.max_speed, player.max_speed)
	
	if input_direction_x == 1:
		player.sprite.flip_h = false
	elif input_direction_x == -1:
		player.sprite.flip_h = true
	
	player.apply_gravity(delta)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
