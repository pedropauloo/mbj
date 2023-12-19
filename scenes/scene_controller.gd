extends Node

@onready var current_level := $main_menu

func _ready():
	connect_signals()
	

func connect_signals():
	# Main Menu
	if(current_level.id == 0):
		current_level.play.connect(_on_play)
		current_level.back_menu.connect(_on_back_menu)
		
	# Game Over
	elif(current_level.id == 1):
		current_level.play.connect(_on_play)
		current_level.quit.connect(_on_quit)
		
	#Levels
	elif(current_level.id == 10):
		Obstacle.set_speed_factor(1)
		current_level.game_over.connect(_on_game_over)
		current_level.change_level.connect(change_level)
	elif(current_level.id == 20):
		current_level.score = load_game().score
		Obstacle.set_speed_factor(2)
		current_level.game_over.connect(_on_game_over)
		#current_level.change_level.connect(change_level)
	else:
		current_level.score = load_game().score
		Obstacle.set_speed_factor(3)
		current_level.game_over.connect(_on_game_over)
		

func _on_play():
	var level = load("res://scenes/game/levels/level_1/level_1.tscn")
	change_level(level)
	
func _on_back_menu():
	var level = load("res://scenes/menus/main_menu/main_menu.tscn")
	change_level(level)
	
func _on_game_over():
	save_game()
	var level = load("res://scenes/menus/game_over/game_over.tscn")
	change_level(level)
	
func _on_quit():
	get_tree().quit()

func change_level(level):
	var level_inst = level.instantiate()
	add_child(level_inst)
	current_level.queue_free()
	current_level = level_inst
	connect_signals()

	
func save_game():
	print("saved")
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(current_level.save())
	save_game.store_line(json_string)
	
func load_game():
	print("loaded")
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		return node_data
