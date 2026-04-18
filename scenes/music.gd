extends Node

@export var menu_music:AudioStreamPlayer2D
@export var level_music:AudioStreamPlayer2D
@export var ending_music:AudioStreamPlayer2D

func _ready() -> void:
	menu_music.play()

func start_level_music():
	menu_music.stop()
	level_music.play()

func start_ending_music():
	level_music.stop()
	ending_music.play()
	
func start_menu_music():
	ending_music.stop()
	menu_music.play()
