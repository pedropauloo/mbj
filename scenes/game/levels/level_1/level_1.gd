extends Level 
@onready var id = 10
@onready var wall = load("res://scenes/game/objects/wall/wall.tscn")
@onready var hole = load("res://scenes/game/objects/hole/hole.tscn")
@onready var oil = load("res://scenes/game/objects/oil/oil.tscn")

var wall_ready = true
var hole_ready = true
var oil_ready = true

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
		
	if(hole_ready):
		var hole_instance = hole.instantiate()
		hole_instance.position.x = 50
		hole_instance.position.y = 1 
		hole_instance.position.z = randi_range(2,-5)
		$Obstacles.add_child(hole_instance)
		hole_ready = false
		
	if(oil_ready):
		var oil_instance = oil.instantiate()
		oil_instance.position.x = 50
		oil_instance.position.y = 1 
		oil_instance.position.z = randi_range(2,-5)
		$Obstacles.add_child(oil_instance)
		oil_ready = false
	
	
func _on_timer_wall_timeout():
	wall_ready = true
	hole_ready = true
	oil_ready = true

func _on_timer_points_timeout():
	score += 1
	$Score.text = str(score) + 'm'
