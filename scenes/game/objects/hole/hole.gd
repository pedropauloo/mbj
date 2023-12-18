extends Obstacle

const SPEED_VARIATION := 0.25

var is_entered = false

func _process(delta):
	super._process(delta)

	if (is_entered):
		is_entered = false

		speed_factor = lerp(speed_factor, speed_factor * 0.5, 1)

			


func _on_body_entered(body):
	if (body is Player):
		is_entered = true
