extends Obstacle
@onready var rock = preload("res://assets/sprites/obstacles/rock.png")
@onready var car = preload("res://assets/sprites/obstacles/car on firing.png")
@onready var barrer = preload("res://assets/sprites/obstacles/barrer.png")

func _ready():
	match get_parent().get_parent().id:
		10:
			$Sprite3D.texture = rock
			$Sprite3D.scale = Vector3(7,7,7)
		20:
			$Sprite3D.texture = car
			$Sprite3D.scale = Vector3(1,1,1)
		30:
			$Sprite2D.texture = barrer
			$Sprite2D.scale = Vector3(1,1,1)
	

func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
		body.hurt.play()
		body.animation.play("hurt")
		speed_variation = -speed_variation
		status = 2
		$Timer.start()
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
