extends Level 
@onready var id = 10
@onready var wall = load("res://scenes/game/objects/wall/wall.tscn")
var wall_ready = true

func _process(delta):
	super._process(delta)
	if(wall_ready):
		var wall_inst = wall.instantiate()
		wall_inst.position.x = 1032 
		wall_inst.position.y = randi_range(80,568)
		get_tree().get_root().add_child(wall_inst)
		wall_ready = false
	

func _on_timer_timeout():
	wall_ready = true
