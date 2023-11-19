extends Menu
@onready var id = 0
signal play()
signal back_menu()

func _on_try_again_pressed():
	emit_signal('play')


func _on_back_to_menu_pressed():
	emit_signal('back_menu')
