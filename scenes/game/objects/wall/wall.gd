extends Obstacle
@onready var rock = preload("res://assets/sprites/obstacles/rock.png")
@onready var car = preload("res://assets/sprites/obstacles/car on firing.png")
@onready var barrer = preload("res://assets/sprites/obstacles/barrer.png")

func _ready():
	super._ready()
	match get_parent().get_parent().id:
		10:
			$Sprite3D.texture = rock
			$Sprite3D.scale = Vector3(7,7,7)
		20:
			$Sprite3D.texture = car
			$Sprite3D.scale = Vector3(1,1,1)
		30:
			$Sprite3D.texture = barrer
			$Sprite3D.scale = Vector3(1,1,1)
	

func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
		body.hurt.play()
		body.animation.play("hurt")
		if(speed_variation > 0):
			speed_variation = -speed_variation
		status = 2
		get_parent().get_parent().get_node('TimerPolice').start()
		get_parent().get_parent().get_node("Police").animation_status = 2
		set_speed_factor(speed_factor + speed_variation)
