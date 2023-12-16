extends Obstacle

var speed_variation := 0.25
const MIN_FACTOR := 0.5 #50% of original speed
const MAX_FACTOR := 1 #100% of original speed
var status := 1

func _process(delta):
	super._process(delta)
	match status:
		#NORMAL
		1:
			pass
		#SLOWING
		2:
			if(speed_factor == MIN_FACTOR):
				speed_variation = -speed_variation
				status = 3
		#SPEEDING
		3:
			if(speed_factor == MAX_FACTOR):
				$Timer.stop()
				status = 1

func _on_body_entered(body):
	if (body is Player):
		speed_variation = -speed_variation
		status = 2
		$Timer.start()
		
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
