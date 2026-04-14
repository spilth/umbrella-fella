extends Node

class_name CharacterStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_state: State
var character: CharacterBody2D

func _init(c: CharacterBody2D):
	character = c
	current_state = GroundedState.new(character)
	
func physics_process(delta: float):		
	var next_state = current_state.physics_process(delta)

	if next_state != null:
		current_state.exit()
		next_state.enter()
		current_state = next_state
