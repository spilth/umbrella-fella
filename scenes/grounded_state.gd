extends State

class_name GroundedState

func physics_process(character: CharacterBody2D, _delta: float) -> State:
	if Input.is_action_just_pressed("Jump") and character.is_on_floor():
		return JumpState.new()

	if not character.is_on_floor():
		return FallingState.new()
	
	var direction = Input.get_axis("Left", "Right")
	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("Down"):
		character.position.y += 3
	
	if character.velocity.x > 0:
		character.animated_sprite_2d.flip_h = false
	
	if character.velocity.x < 0:
		character.animated_sprite_2d.flip_h = true
		
	if character.velocity.x != 0:
		character.animated_sprite_2d.animation = "running"
	else:
		character.animated_sprite_2d.animation = "idle"

	return null
