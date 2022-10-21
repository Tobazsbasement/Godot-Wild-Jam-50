extends PlayerState

func enter():
	player.sprite.play("Running")
	if PlayerStats.double_jump_unlocked:
		player.jump_count = 1
		player.hurtbox.disabled = true

func exit():
	pass

func physics_update(delta):
	if player.sprint == true:
		player.acceleration = 25000
		player.max_speed = 20000
		player.friction = 0.9
	else:
		player.acceleration = 15000
		player.max_speed = 10000
		player.friction = 0.6
	
	if not player.is_on_floor():
		if player.velocity.y > 0:
			state_machine.transition_to("Fall")
			return
	
	var input_direction_x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	player.velocity.x = player.acceleration * input_direction_x * delta
	player.velocity.x = clamp(player.velocity.x, -player.max_speed, player.max_speed)
	player.apply_gravity(delta)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if input_direction_x == 1:
		player.sprite.flip_h = false
	elif input_direction_x == -1:
		player.sprite.flip_h = true
	
	if Input.is_action_just_pressed("Jump"):
		state_machine.transition_to("Jump")
	elif is_equal_approx(input_direction_x, 0):
		state_machine.transition_to("Idle")

