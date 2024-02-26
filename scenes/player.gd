extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -450.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_sound = $JumpSound
@onready var float_sound = $FloatSound

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):		
	if not is_on_floor():
		if Input.is_action_just_pressed("Open Umbrella"):
			float_sound.play()
			
		if Input.is_action_just_released("Open Umbrella"):
			float_sound.stop()

		if Input.is_action_pressed("Open Umbrella") && velocity.y > 0:
			animated_sprite_2d.animation = "floating"
			velocity.y = gravity * 4 * delta
		else:
			animated_sprite_2d.animation = "jumping"
			velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("Down") and is_on_floor():
		position.y += 3
				

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor():
		if float_sound.playing:
			float_sound.stop()
			
		if Input.is_action_pressed("Block"):
			animated_sprite_2d.animation = "blocking"
		elif velocity.x != 0:
			animated_sprite_2d.animation = "running"
		else:
			animated_sprite_2d.animation = "idle"
	
	move_and_slide()

	
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false

	
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true


