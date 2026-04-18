class_name GateCoin

extends Area2D

@export var gate: Gate

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready():
	gate.register_coin(self)

func _on_body_entered(body):
	if (body.name == "Player"):
		audio_stream_player_2d.play()
		call_deferred("pickup")

func pickup():
	sprite_2d.visible = false
	collision_shape_2d.disabled = true
	gate.insert_coin()

func _on_audio_stream_player_2d_finished():
	queue_free()
