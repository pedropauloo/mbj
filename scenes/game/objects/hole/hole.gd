extends Obstacle

const PERCENTAGE_SPEED_REDUCTION = 0.25

func _init():
	super._init(20)

func _on_body_entered(body):
	if (body is Player):
		Obstacle.set_speed_factor(0.8)
