class_name Exit

extends Area2D

@export var destination : PackedScene
@export var lockedColor: Color = Color.RED
@export var unlockedColor: Color = Color.GREEN

@onready var light = $Light
@onready var progress_label = $ProgressLabel
@onready var unlocked_sound = $UnlockedSound

var locked = true
var coins = 0
var required = 0

func _ready():
	light.color = lockedColor
	progress_label.text = str(coins, "/", required)

func _on_body_entered(body):
	if locked:
		return
	
	if (body.name == "Player"):
		call_deferred("load_level")

func load_level():
	get_tree().change_scene_to_packed(destination)

func register_coin(coin: Coin):
	required = required + 1
	update_label()

func insert_coin():
	coins = coins + 1
	update_label()
	
	if coins >= required && locked:
		locked = false
		light.color = unlockedColor
		unlocked_sound.play()

func update_label():
	progress_label.text = str(coins, "/", required)
