class_name Level extends Node3D
signal game_over()

func _process(delta):
	if($player.hp <= 0):
		emit_signal('game_over')
