extends Obstacle

var speed_variation = 0.25
const MIN_SPEED = 0.50 * SPEED

var is_slow_start = false
var is_speed_start = false

func _process(delta):
	super._process(delta)
		
	if(is_slow_start and !is_speed_start):
		is_slow_start = false
		speed_variation = -speed_variation
		return
	
	if(!is_slow_start and !is_speed_start and SPEED * speed_factor <= MIN_SPEED):
		is_speed_start = true
		speed_variation = -speed_variation
		return
	
	if(!is_slow_start and is_speed_start and SPEED * speed_factor == MIN_SPEED):
		is_speed_start = false
		$Timer.stop()

func _on_body_entered(body):
	if (body is Player):
		$Timer.start()
		is_slow_start = true
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
