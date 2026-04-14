extends Node

class_name State

const SPEED = 250.0
const JUMP_VELOCITY = -450.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var character: CharacterBody2D

func _init(c: CharacterBody2D):
	character = c

func enter() -> void:
	pass

func physics_process(_delta: float) -> State:
	return null

func exit() -> void:
	pass
