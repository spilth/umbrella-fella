class_name Gate

extends StaticBody2D

@export var lockedColor: Color = Color.RED
@export var unlockedColor: Color = Color.GREEN
@export var light: ColorRect
@export var collision_shape: CollisionShape2D
@export var progress_label: Label
@export var unlocked_sound: AudioStreamPlayer2D
@export var coin_sprite: AnimatedSprite2D

var locked: bool = true
var coins: int = 0
var required: int = 0

func _ready():
	light.color = lockedColor
	progress_label.text = str(required - coins)

func register_coin(_coin: GateCoin):
	required = required + 1
	update_label()

func insert_coin():
	coins = coins + 1
	update_label()
	
	if coins >= required && locked:
		locked = false
		light.color = unlockedColor
		collision_shape.disabled = true
		coin_sprite.visible = false
		unlocked_sound.play()

func update_label():
	var text: String = ""
	if required - coins > 0:
		text = str(required - coins)

	progress_label.text = text
