extends Area2D

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

@onready var goal = %Goal

func _on_body_entered(body):
	if (body.name == "Player"):
		audio_stream_player_2d.play()
		call_deferred("pickup")

func pickup():
	sprite_2d.visible = false
	collision_shape_2d.disabled = true
	goal.accept_coin()

func _on_audio_stream_player_2d_finished():
	queue_free()
