extends Area2D

@export var destination : PackedScene

func _on_body_entered(body):
	if (body.name == "Player"):
		call_deferred("load_level")

func load_level():
	get_tree().change_scene_to_packed(destination)
