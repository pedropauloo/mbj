extends Node

@onready var current_level := $main_menu

func _ready():
	connect_signals()
	

func connect_signals():
	if(current_level.id == 0):
		current_level.play.connect(_on_play)
		current_level.back_menu.connect(_on_back_menu)
		
	elif(current_level.id == 1):
		current_level.play.connect(_on_play)
		current_level.quit.connect(_on_quit)
	else:
		current_level.game_over.connect(_on_game_over)


func _on_play():
	var level = load("res://scenes/game/levels/level_1/level_1.tscn").instantiate()
	change_level(level)
	
func _on_back_menu():
	var level = load("res://scenes/game/menus/main_menu/main_menu.tscn").instantiate()
	change_level(level)
	
func _on_game_over():
	var level = load("res://scenes/game/menus/game_over/game_over.tscn").instantiate()
	change_level(level)
	
func _on_quit():
	get_tree().quit()

func change_level(next_level):
	add_child(next_level)
	current_level.queue_free()
	current_level = next_level 
	connect_signals()
