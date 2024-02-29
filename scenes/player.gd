extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -450.0

@onready var character_state_machine = $CharacterStateMachine
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var float_sound = $FloatSound
@onready var jump_sound = $JumpSound

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):		
	character_state_machine.physics_process(self, delta)
	
	move_and_slide()
