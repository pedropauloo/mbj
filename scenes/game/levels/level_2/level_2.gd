extends Level 
@onready var id = 20
@onready var wall = preload("res://scenes/game/objects/wall/wall.tscn")
@onready var hole = preload("res://scenes/game/objects/hole/hole.tscn")
@onready var oil = preload("res://scenes/game/objects/oil/oil.tscn")
@onready var car = preload("res://scenes/game/objects/car/car.tscn")
@onready var ramp = preload("res://scenes/game/objects/ramp/ramp.tscn")

@onready var victim_1 = preload("res://scenes/game/objects/victims/victim_1/victim_1.tscn")
@onready var victim_2 = preload("res://scenes/game/objects/victims/victim_2/victim_2.tscn")
@onready var victim_3 = preload("res://scenes/game/objects/victims/victim_3/victim_3.tscn")

var wall_ready = false
var hole_ready = false
var oil_ready = false
var car_ready = false
var ramp_ready = false

var v1_ready = false
var v2_ready = false
var v3_ready = false

var next_level = preload("res://scenes/game/levels/level_3/level_3.tscn")

func _ready():
	for i in $Obstacles.get_children():
		i.queue_free()
		
func _process(delta):
	super._process(delta)
	
	# Obstacles
	if(wall_ready):
		var wall_inst = wall.instantiate()
		wall_inst.position.x = 50 
		wall_inst.position.y = 1 
		wall_inst.position.z = randi_range(1,-3)
		$Obstacles.add_child(wall_inst)
		wall_ready = false
		
	elif(hole_ready):
		var hole_instance = hole.instantiate()
		hole_instance.position.x = 50
		hole_instance.position.y = 0 
		hole_instance.position.z = randi_range(2,-5)
		$Obstacles.add_child(hole_instance)
		hole_ready = false
		
	elif(oil_ready):
		var oil_instance = oil.instantiate()
		oil_instance.position.x = 50
		oil_instance.position.y = 0 
		oil_instance.position.z = randi_range(2,-5)
		$Obstacles.add_child(oil_instance)
		oil_ready = false
		
	elif(car_ready):
		var car_instance = car.instantiate()
		car_instance.position.x = 50
		car_instance.position.y = 0 
		car_instance.position.z = randi_range(1,-3)
		$Obstacles.add_child(car_instance)
		car_ready = false
		
	elif(ramp_ready):
		var ramp_instance = ramp.instantiate()
		ramp_instance.position.x = 50
		ramp_instance.position.y = 0 
		ramp_instance.position.z = randi_range(1,-3)
		$Obstacles.add_child(ramp_instance)
		ramp_ready = false
		
	# Victims
	if(v1_ready):
		var v1_inst = victim_1.instantiate()
		v1_inst.position.x = 50 
		v1_inst.position.y = 1 
		v1_inst.position.z = -5
		$Victims.add_child(v1_inst)
		v1_inst.robbed.connect(_on_robbed)
		v1_ready = false
		
	elif(v2_ready):
		var v2_inst = victim_2.instantiate()
		v2_inst.position.x = 50 
		v2_inst.position.y = 1 
		v2_inst.position.z = -5
		$Victims.add_child(v2_inst)
		v2_inst.robbed.connect(_on_robbed)
		v2_ready = false
		
	elif(v3_ready):
		var v3_inst = victim_3.instantiate()
		v3_inst.position.x = 50 
		v3_inst.position.y = 1 
		v3_inst.position.z = -5
		$Victims.add_child(v3_inst)
		v3_inst.robbed.connect(_on_robbed)
		v3_ready = false
	
	# Next Level:
	if(score > 150):
		get_parent().save_game()
		emit_signal("change_level",next_level)
	
func _on_timer_obstacles_timeout():
	if($Obstacles.get_children().size() <= 10):
		var n = randi_range(1,100)
		# Wall 20%
		if (n <= 20):
			wall_ready = true  
		# Oil 20%
		elif (n <= 40):
			oil_ready = true
		# Hole 20%	
		elif (n <= 60):
			hole_ready = true
		# Car 20%	
		elif (n <= 80):
			car_ready = true
		# Ramp 5%
		elif (n <= 85):
			ramp_ready = true
		# Nothing 15%
		else:
			pass

func _on_timer_points_timeout():
	score += 2



func _on_timer_victims_timeout():
	match randi_range(1,10):
		1:
			v1_ready = true
		2:
			v2_ready = true
		3:
			v3_ready = true

func _on_robbed(money):
	$money_anim.add_money(money)

func _on_timer_police_timeout():
	Obstacle.set_speed_factor(Obstacle.speed_factor + Obstacle.speed_variation)
