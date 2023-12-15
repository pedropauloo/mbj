class_name Obstacle extends Area3D

const SPEED: float = 10
static var speed_factor: float = 1.0

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= SPEED * speed_factor * delta
	transform.origin = new_position

func _process(delta):
	if(position.x < -10):
		queue_free()

static func set_speed_factor(factor: float):
	speed_factor = factor
