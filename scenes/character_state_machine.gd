extends Node

class_name CharacterStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_state: State

func _ready():
	current_state = GroundedState.new()

func physics_process(character: CharacterBody2D, delta: float):		
	var next_state = current_state.physics_process(character, delta)

	if next_state != null:
		current_state.exit(character)
		next_state.enter(character)
		current_state = next_state
