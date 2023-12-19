extends Obstacle


func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
		body.animation.play("hurt")
		speed_variation = -speed_variation
		status = 2
		$Timer.start()
		
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
