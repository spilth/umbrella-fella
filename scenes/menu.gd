extends Node

@onready var play_button = $PlayButton

func _ready():
	$PlayButton.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
