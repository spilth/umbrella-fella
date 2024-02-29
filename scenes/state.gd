extends Node

class_name State

const SPEED = 250.0
const JUMP_VELOCITY = -450.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter(_character: CharacterBody2D) -> void:
	pass

func physics_process(_character: CharacterBody2D, _delta: float) -> State:
	return null

func exit(_character: CharacterBody2D) -> void:
	pass
