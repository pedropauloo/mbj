class_name Obstacle extends Area3D

const SPEED: float = 10
const DEFAULT_SPEED_FACTOR: float = 1.0

static var speed: float = SPEED
static var speed_factor: float = DEFAULT_SPEED_FACTOR

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= SPEED * speed_factor * delta
	transform.origin = new_position

func _process(delta):
	if(speed_factor < DEFAULT_SPEED_FACTOR):
		speed_factor += min(DEFAULT_SPEED_FACTOR, (speed / 1000) * delta) # increase speed factor if it's less than 1

	if(position.x < -10):
		queue_free()

static func set_speed(_speed):
	speed = _speed

