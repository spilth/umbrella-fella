extends Node

@export var play_again_button:Button

func _ready():
	play_again_button.grab_focus()
	Autoloaded.get_node("Levels").stop()
	Autoloaded.get_node("Ending").play()

func _on_play_again_pressed():
	play_again()

func _on_main_menu_pressed():
	main_menu()

func play_again():
	Autoloaded.get_node("Ending").stop()
	Autoloaded.get_node("Levels").play()
	get_tree().change_scene_to_file("res://scenes/levels/level0.tscn")

func main_menu():
	Autoloaded.get_node("Ending").stop()
	Autoloaded.get_node("Menu").play()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
