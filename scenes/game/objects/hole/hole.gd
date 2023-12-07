class_name Hole extends Area3D
@export var speed = 30

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= speed * delta
	transform.origin = new_position

func _process(delta):
	if(position.x < -10):
		queue_free()

func _on_body_entered(body):
	if (body is Player):
		body.speed = 2
