extends Area2D

@export var destination : PackedScene
@export var coinsRequired : int = 10
@onready var red_light = $RedLight
@onready var progress_label = $ProgressLabel
@onready var unlocked_sound = $UnlockedSound

var unlocked = false
var coins = 0

func _ready():
	progress_label.text = str(coins, "/", coinsRequired)
	pass
	
func _on_body_entered(body):
	if unlocked:
		if (body.name == "Player"):
			call_deferred("load_level")
	else:
		print("Exit needs to be unlocked!")

func load_level():
	get_tree().change_scene_to_packed(destination)

func insert_coin():
	coins = coins + 1
	progress_label.text = str(coins, "/", coinsRequired)
	
	if coins >= coinsRequired && !unlocked:
		unlocked = true
		unlocked_sound.play()
		red_light.visible = false
