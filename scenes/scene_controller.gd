extends Node

@onready var current_level := $main_menu
var has_died = false

func _ready():
	connect_signals()

func connect_signals():
	match current_level.id:
		# Game Over
		0:
			current_level.play.connect(_on_play)
			current_level.back_menu.connect(_on_back_menu)
			
		# Main Menu
		1:
			current_level.play.connect(_on_play)
			current_level.quit.connect(_on_quit)
			current_level.leaderboard.connect(_on_leaderboard)
		
		# Leaderboard
		2:
			current_level.back_menu.connect(_on_back_menu)
			
		# Levels
		10:
			Obstacle.set_speed_factor(1)
			current_level.game_over.connect(_on_game_over)
			current_level.change_level.connect(change_level)
		20:
			current_level.score = load_game().score
			Obstacle.set_speed_factor(1.5)
			current_level.game_over.connect(_on_game_over)
			current_level.change_level.connect(change_level)
		30:
			current_level.score = load_game().score
			Obstacle.set_speed_factor(2)
			current_level.game_over.connect(_on_game_over)
		

func _on_play():
	var level = load("res://scenes/game/levels/level_1/level_1.tscn")
	Obstacle.set_speed_factor(1)
	var has_died = false
	change_level(level)
	
func _on_back_menu():
	var level = load("res://scenes/menus/main_menu/main_menu.tscn")
	change_level(level)
	
func _on_game_over():
	save_game()
	var level = load("res://scenes/menus/game_over/game_over.tscn")
	has_died = true
	change_level(level)
	
func _on_quit():
	get_tree().quit()

func _on_leaderboard():
	var saves = load_all()
	var level = load("res://scenes/menus/leaderboard/leaderboard.tscn")
	change_level(level)
	current_level._set_scores(saves)
	
func change_level(level):
	var level_inst = level.instantiate()
	add_child(level_inst)
	current_level.queue_free()
	current_level = level_inst
	connect_signals()


func next_save(file):
	var temp = file.split("_")
	var n_file = temp[0].to_int()
	if(n_file >= 5):
		n_file = 0
	var file_name = str( n_file + 1 ) +'_savegame.save'
	return file_name

func get_most_recent_save():
	var file_name := '1_savegame.save' 
	var file_time := 0
	var dir = DirAccess.open("res://assets/saves/")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			var new_time = FileAccess.get_modified_time("res://assets/saves/" + file)
			if file_time < new_time:
				file_name = file
				file_time = new_time
	dir.list_dir_end()
	return file_name
	
func save_game():
	var file : String
	if(has_died):
		file = next_save(get_most_recent_save())
	else:
		file = get_most_recent_save()
	var save_game = FileAccess.open("res://assets/saves/"+ file, FileAccess.WRITE)
	var json_string = JSON.stringify(current_level.save())
	save_game.store_line(json_string)
	
func load_game():
	var save_game = FileAccess.open("res://assets/saves/" +get_most_recent_save(), FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		return node_data

func load_all():
	var saves_json = []
	for n in range(0,5):
		var save = "res://assets/saves/"+str(n+1)+"_savegame.save"
		if FileAccess.file_exists(save):
			var save_game = FileAccess.open(save, FileAccess.READ)
			while save_game.get_position() < save_game.get_length():
				var json_string = save_game.get_line()
				saves_json.append(json_string)
	return saves_json
	
func save_name(new_name):
	var file = get_most_recent_save()
	var load_game = FileAccess.open("res://assets/saves/"+ file, FileAccess.READ)
	var node_data : Dictionary
	while load_game.get_position() < load_game.get_length():
		var json_string = load_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		node_data = json.get_data()
	node_data.username = new_name
	var save_game = FileAccess.open("res://assets/saves/" + file, FileAccess.WRITE)
	var json_string = JSON.stringify(node_data)
	save_game.store_line(json_string)
		
