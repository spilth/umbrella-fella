class_name Coin

extends Area2D

@export var exit: Exit
@export var audio_stream_player_2d: AudioStreamPlayer2D
@export var sprite_2d: AnimatedSprite2D
@export var collision_shape_2d: CollisionShape2D

func _ready():
	exit.register_coin(self)

func _on_body_entered(body: CharacterBody2D):
	if (body.name == "Player"):
		audio_stream_player_2d.play()
		call_deferred("pickup")

func pickup():
	sprite_2d.visible = false
	collision_shape_2d.disabled = true
	exit.insert_coin()

func _on_audio_stream_player_2d_finished():
	queue_free()
