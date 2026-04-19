class_name Exit

extends Area2D

@export var destination : PackedScene
@export var lockedColor: Color = Color.RED
@export var unlockedColor: Color = Color.GREEN
@export var light: ColorRect
@export var progress_label: Label
@export var unlocked_sound: AudioStreamPlayer2D
@export var coin_sprite: AnimatedSprite2D

var locked: bool = true
var coins: int = 0
var required: int = 0

func _ready():
	light.color = lockedColor
	progress_label.text = str(required - coins)

func _on_body_entered(body: Node) -> void:
	if locked:
		return
	
	if (body.name == "Player"):
		call_deferred("load_level")

func load_level():
	get_tree().change_scene_to_packed(destination)

func register_coin(_coin: Coin):
	required = required + 1
	update_label()

func insert_coin():
	coins = coins + 1
	update_label()
	
	if coins >= required && locked:
		locked = false
		light.color = unlockedColor
		coin_sprite.visible = false
		unlocked_sound.play()

func update_label():
	var text: String = ""
	if required - coins > 0:
		text = str(required - coins)

	progress_label.text = text
