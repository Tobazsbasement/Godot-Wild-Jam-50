extends PlayerState

func enter():
	pass

func exit():
	pass

func physics_update(delta):
	var input_direction_x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	player.velocity.x = input_direction_x * player.acceleration * delta
	player.velocity.x = clamp(player.velocity.x, -player.max_speed, player.max_speed)
	
	if player.is_on_floor() and is_equal_approx(input_direction_x, 0):
		state_machine.transition_to("Idle")
		return
	elif player.is_on_floor() and input_direction_x != 0:
		state_machine.transition_to("Walk")
	
	if input_direction_x == 1:
		player.sprite.flip_h = false
	elif input_direction_x == -1:
		player.sprite.flip_h = true
	
	if Input.is_action_just_pressed("Jump") and !player.is_on_floor() and PlayerStats.double_jump_unlocked:
		if player.jump_count > 0:
			state_machine.transition_to("Double Jump")
			player.jump_count -= 1
			if player.velocity.y > 0:
				player.velocity.y = 0
	player.apply_gravity(delta)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
