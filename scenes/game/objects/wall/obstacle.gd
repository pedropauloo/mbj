class_name Obstacle extends Area2D
@export var speed = 400

func _physics_process(delta):
	position.x += -1*speed*delta

func _process(delta):
	if(position.x < 0):
		queue_free()

func _on_body_entered(body):
	if (body is Player):
		body.hp = 0
