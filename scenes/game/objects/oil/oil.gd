extends Obstacle
var player : Player

func _on_body_entered(body):
	if (body is Player):
		player = body
		player.oiled = true
		speed_variation = -speed_variation
		status = 2
		$Oiled.play()
		$Timer.start()
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
