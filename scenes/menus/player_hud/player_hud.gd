extends GUI
var hp:= 100
var score:= 0

func _process(delta):
	$Score.text = str(score) + "m"
	$VBoxContainer/HpBar.value = hp


