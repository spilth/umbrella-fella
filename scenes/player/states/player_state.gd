class_name PlayerState

extends Node

const SPEED: float = 125.0
const JUMP_VELOCITY: float = -225.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var character: CharacterBody2D

func _init(c: CharacterBody2D):
	character = c

func enter() -> void:
	pass

func physics_process(_delta: float) -> PlayerState:
	return null

func exit() -> void:
	pass
