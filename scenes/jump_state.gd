extends State

class_name JumpState

func enter(character) -> void:
	character.jump_sound.play()
	character.velocity.y = JUMP_VELOCITY
	character.animated_sprite_2d.animation = "jumping"

func physics_process(character: CharacterBody2D, delta: float) -> State:
	character.velocity.y += gravity * delta

	if character.velocity.y > 0:
		return FallingState.new()

	if character.is_on_floor():
		return GroundedState.new()

	var direction = Input.get_axis("Left", "Right")
	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
	
	if character.velocity.x > 0:
		character.animated_sprite_2d.flip_h = false
	
	if character.velocity.x < 0:
		character.animated_sprite_2d.flip_h = true

	return null
