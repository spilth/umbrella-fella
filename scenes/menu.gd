extends Node

@onready var play_button = $PlayButton

func _ready():
	$PlayButton.grab_focus()
	Autoloaded.get_node("Menu").play()

func _on_play_button_pressed():
	Autoloaded.get_node("Menu").stop()
	Autoloaded.get_node("Levels").play()
	get_tree().change_scene_to_file("res://scenes/level0.tscn")
	

func _on_quit_button_pressed():
	get_tree().quit()
