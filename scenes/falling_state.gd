extends State

class_name FallingState

func enter() -> void:
	character.animated_sprite_2d.animation = "falling"

func physics_process(delta: float) -> State:
	var direction = Input.get_axis("Left", "Right")
	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
		
	if character.velocity.x > 0:
		character.animated_sprite_2d.flip_h = false
	
	if character.velocity.x < 0:
		character.animated_sprite_2d.flip_h = true

	character.velocity.y += gravity * delta

	if Input.is_action_pressed("Open Umbrella") && character.velocity.y > 0:
		return FloatingState.new(character)

	if character.is_on_floor:
		return GroundedState.new(character)
	
	
	return null

