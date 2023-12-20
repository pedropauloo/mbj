extends GUI
@onready var id = 0
var save_jsn : JSON
signal play()
signal back_menu()

func _ready():
	$FinalScore.text = str(get_parent().load_game().score) + "m"
	pass
func _on_try_again_pressed():
	submit_name()
	emit_signal('play')


func _on_back_to_menu_pressed():
	submit_name()
	emit_signal('back_menu')


func submit_name():
	get_parent().save_name($LineEdit.text)
