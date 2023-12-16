extends Level 
@onready var id = 10
@onready var wall = load("res://scenes/game/objects/wall/wall.tscn")
var wall_ready = true

func _ready():
	for i in $Obstacles.get_children():
		i.queue_free()
		
func _process(delta):
	super._process(delta)
	if(wall_ready):
		var wall_inst = wall.instantiate()
		wall_inst.position.x = 50 
		wall_inst.position.y = 1 
		wall_inst.position.z = randi_range(2,-5)
		$Obstacles.add_child(wall_inst)
		wall_ready = false
	
	
func _on_timer_wall_timeout():
	wall_ready = true

func _on_timer_points_timeout():
	score += 1
	$player_hud.score = score



