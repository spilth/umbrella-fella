extends Node

func _ready():
	Autoloaded.get_node("Levels").stop()
	Autoloaded.get_node("Ending").play()

func _on_play_again_pressed():
	Autoloaded.get_node("Levels").play()
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_main_menu_pressed():
	Autoloaded.get_node("Ending").stop()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
