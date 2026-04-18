extends Node

@export var play_again_button:Button

func _ready():
	play_again_button.grab_focus()
	music.start_ending_music()

func _on_play_again_pressed():
	music.start_level_music()
	get_tree().change_scene_to_file("res://scenes/levels/level0.tscn")

func _on_main_menu_pressed():
	music.start_menu_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
