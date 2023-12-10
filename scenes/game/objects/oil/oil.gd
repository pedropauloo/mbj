class_name Oil extends Area3D

@export var speed = 30

var is_entered = false

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= speed * delta
	transform.origin = new_position

func _process(delta):
	if position.x < -10 and not is_entered:
		queue_free()

func _on_body_entered(body):
	if (body is Player):
		is_entered = true
		var acceleration = 20
		var deceleration = 20
		
		for i in range(3): 
			body.velocity.z -= acceleration
			body.animation.play("turn_left")
			await get_tree().create_timer(0.5).timeout
			body.animation.play("turn_right")
			
		await get_tree().create_timer(0.5).timeout
		
		for i in range(3):
			body.velocity.z += deceleration
			body.animation.play("turn_left")
			await get_tree().create_timer(0.5).timeout
			body.animation.play("turn_right")
			
		is_entered = false
