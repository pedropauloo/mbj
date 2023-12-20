extends GUI
@onready var id = 1
signal play()
signal quit()
signal leaderboard()

func _on_play_pressed():
	emit_signal('play')


func _on_quit_pressed():
	emit_signal('quit')


func _on_leaderboard_pressed():
	emit_signal('leaderboard')
