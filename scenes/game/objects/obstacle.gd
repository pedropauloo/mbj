class_name Obstacle extends Area3D

const SPEED: float = 10
static var speed_factor: float = 1.0
static var speed_variation := 0.25
static var MIN_FACTOR : float #50% of original speed
static var MAX_FACTOR : float #100% of original speed
static var status := 1
var extras : float = 0 # Any extra bonuses from quirky obstacles

func _ready():
	match get_parent().get_parent().id:
		10:
			MIN_FACTOR = 0.5
			MAX_FACTOR = 1.0
		20:
			MIN_FACTOR = 0.75
			MAX_FACTOR = 1.5
		30:
			MIN_FACTOR = 1
			MAX_FACTOR = 2
			
func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= (SPEED * speed_factor * delta) + extras
	transform.origin = new_position

func _process(delta):
	if(position.x < 0):
		queue_free()
	match status:
		#NORMAL
		1:
			pass
		#SLOWING
		2:
			if(speed_factor == MIN_FACTOR ):
				speed_variation = -speed_variation
				status = 3
		#SPEEDING
		3:
			if(speed_factor == MAX_FACTOR):
				_ready()
				get_parent().get_parent().get_node('TimerPolice').stop()
				status = 1

static func set_speed_factor(factor: float):
	speed_factor = factor

