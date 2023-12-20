class_name Level extends Node3D
@onready var score : int
signal game_over()
signal change_level(next_level)


func _process(delta):
	$player_hud.hp = $player.hp
	if($player.hp <= 0):
		emit_signal('game_over')
func save():
	var save_dict = {
		"username" : "TST",
		"score" : score
	}
	return save_dict
