extends GUI
@onready var id = 1
signal play()
signal quit()

func _on_play_pressed():
	emit_signal('play')


func _on_quit_pressed():
	emit_signal('quit')
