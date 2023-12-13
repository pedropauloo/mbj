extends Obstacle

var is_entered = false

func _init():
	super._init(20)

func _on_body_entered(body):
	if (body is Player):
		is_entered = true
		
		Obstacle.set_speed_factor(0.8)
		
		is_entered = false
