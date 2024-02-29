extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -450.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var float_sound = $FloatSound
@onready var jump_sound = $JumpSound

var character_state_machine: CharacterStateMachine

func _ready():
	character_state_machine = CharacterStateMachine.new(self)

func _physics_process(delta):		
	character_state_machine.physics_process(delta)
	
	move_and_slide()
