extends Obstacle
var player : Player
var water_hole = preload("res://assets/sprites/obstacles/water hole.png")

func _ready():
	match get_parent().get_parent().id:
		10:
			$Sprite2D.modulate = Color(0.28,0.11,0.1,1)
		20:
			$Sprite2D.modulate = Color(0.15,0.01,0.08,1)
		30:
			$Sprite2D.texture = water_hole
			
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
