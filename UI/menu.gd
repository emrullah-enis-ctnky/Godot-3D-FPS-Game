extends Node2D
const MENU = preload("res://UI/menu.tscn")
@onready var pause_menu: VBoxContainer = $CanvasLayer/PauseMenu
@onready var main_menu: VBoxContainer = $CanvasLayer/MainMenu
const LEVEL_BUTTON = preload("res://UI/levelButton.tscn")



func _on_button_resume_pressed() -> void:
	GameManager.resume_game()

func _on_button_settings_pressed() -> void:
	pass


func _on_button_menu_pressed() -> void:
	main_menu.visible=true
	pause_menu.visible=false
	
	

func _on_button_start_pressed() -> void:
	GameManager.start_game()
	
func _on_button_quit_pressed() -> void:
	get_tree().quit()
