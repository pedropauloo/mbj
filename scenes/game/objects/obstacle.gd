class_name Obstacle extends Area3D

const SPEED: float = 10
static var speed_factor: float = 1.0
var speed_variation := 0.25
const MIN_FACTOR := 0.5 #50% of original speed
const MAX_FACTOR := 1 #100% of original speed
var status := 1

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= SPEED * speed_factor * delta
	transform.origin = new_position

func _process(delta):
	if(position.x < -10):
		queue_free()
	match status:
		#NORMAL
		1:
			pass
		#SLOWING
		2:
			if(speed_factor == MIN_FACTOR):
				speed_variation = -speed_variation
				get_parent().get_parent().get_node("police").animation_status = 2
				status = 3
		#SPEEDING
		3:
			if(speed_factor == MAX_FACTOR):
				$Timer.stop()
				get_parent().get_parent().get_node("police").animation_status = 3
				status = 1

static func set_speed_factor(factor: float):
	speed_factor = factor

