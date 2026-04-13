class_name Exit

extends Area2D

@export var destination : PackedScene
@export var coinsRequired : int = 10
@export var lockedColor: Color = Color.RED
@export var unlockedColor: Color = Color.GREEN

@onready var light = $Light
@onready var progress_label = $ProgressLabel
@onready var unlocked_sound = $UnlockedSound

var locked = true
var coins = 0

func _ready():
	light.color = lockedColor
	progress_label.text = str(coins, "/", coinsRequired)
	pass
	
func _on_body_entered(body):
	if !locked:
		if (body.name == "Player"):
			call_deferred("load_level")

func load_level():
	get_tree().change_scene_to_packed(destination)

func insert_coin():
	coins = coins + 1
	progress_label.text = str(coins, "/", coinsRequired)
	
	if coins >= coinsRequired && locked:
		locked = false
		light.color = unlockedColor
		unlocked_sound.play()
