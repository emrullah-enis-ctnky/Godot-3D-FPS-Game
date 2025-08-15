extends Node
signal game_started
signal game_stoped
func start_game():
	game_started.emit()
func stop_game():
	game_stoped.emit()
