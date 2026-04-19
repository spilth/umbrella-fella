class_name PlayerStateMachine

extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_state: PlayerState
var character: CharacterBody2D

func _init(c: CharacterBody2D):
	character = c
	current_state = GroundedState.new(character)
	
func physics_process(delta: float):		
	var next_state: PlayerState = current_state.physics_process(delta)

	if next_state != null:
		current_state.exit()
		next_state.enter()
		current_state = next_state
