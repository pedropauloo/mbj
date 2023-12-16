class_name Level extends Node3D
@onready var score = 0
signal game_over()

func _process(delta):
	$player_hud.hp = $player.hp
	if($player.hp <= 0):
		emit_signal('game_over')

func save():
	var save_dict = {
		"username" : "TST",		
		"score" : score
		#"hp" : 100
	}
	return save_dict
