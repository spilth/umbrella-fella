extends State

class_name FloatingState

func enter() -> void:
	character.animated_sprite_2d.animation = "floating"
	character.float_sound.play()
	
func physics_process(delta: float) -> State:
	character.velocity.y = gravity * 4 * delta
	
	if not Input.is_action_pressed("Open Umbrella"):
		return FallingState.new(character)
		
	var direction = Input.get_axis("Left", "Right")
	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
	
	if character.velocity.x > 0:
		character.animated_sprite_2d.flip_h = false
	
	if character.velocity.x < 0:
		character.animated_sprite_2d.flip_h = true
	
	if character.is_on_floor():
		return GroundedState.new(character)
	
	return null
	
func exit() -> void:
	character.float_sound.stop()
