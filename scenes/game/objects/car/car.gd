extends Obstacle
@onready var car_1 = preload("res://assets/sprites/obstacles/carros/spr_bluecar_0.png")
@onready var car_2 = preload("res://assets/sprites/obstacles/carros/spr_car4_0.png")
@onready var car_3 = preload("res://assets/sprites/obstacles/carros/spr_van_0.png")
@onready var car_4 = preload("res://assets/sprites/obstacles/carros/spr_vintage_0.png")

func _ready():
	super._ready()
	match randi_range(1,4):
		1:
			$Sprite3D.texture = car_1
			extras = 0.1
		2:
			$Sprite3D.texture = car_2
			extras = 0.2
		3:
			$Sprite3D.texture = car_3
			extras = 0.05
		4:
			$Sprite3D.texture = car_4
			extras = 0.3


func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
		body.hurt.play()
		body.animation.play("hurt")
		if(speed_variation > 0):
			speed_variation = -speed_variation
		status = 2
		get_parent().get_parent().get_node("Police").animation_status = 2
		set_speed_factor(speed_factor + speed_variation)

