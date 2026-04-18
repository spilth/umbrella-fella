extends Node

@export var play_button: Button

func _ready():
	play_button.grab_focus()

func _on_play_button_pressed():
	music.start_level_music()
	get_tree().change_scene_to_file("res://scenes/levels/level0.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
