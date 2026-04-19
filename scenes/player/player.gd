extends CharacterBody2D

@export var animated_sprite_2d: AnimatedSprite2D
@export var float_sound: AudioStreamPlayer2D
@export var jump_sound: AudioStreamPlayer2D

var player_state_machine: PlayerStateMachine

func _ready():
	player_state_machine = PlayerStateMachine.new(self)

func _physics_process(delta):		
	player_state_machine.physics_process(delta)
	
	move_and_slide()
