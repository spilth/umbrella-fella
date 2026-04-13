extends Node

@export var play_button: Button

func _ready():
	play_button.grab_focus()
	Autoloaded.get_node("Menu").play()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_game()
		
	if Input.is_action_just_pressed("ui_cancel"):
		quit_game()

func _on_play_button_pressed():
	start_game()

func _on_quit_button_pressed():
	quit_game()

func start_game():
	Autoloaded.get_node("Menu").stop()
	Autoloaded.get_node("Levels").play()
	get_tree().change_scene_to_file("res://scenes/level0.tscn")

func quit_game():
	get_tree().quit()
