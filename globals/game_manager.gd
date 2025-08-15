extends Node
signal game_started
signal game_stoped
signal game_paused
signal game_resumed
func start_game():
	game_started.emit()
func stop_game():
	game_stoped.emit()
func pause_game():
	game_paused.emit()
func resume_game():
	game_resumed.emit()
