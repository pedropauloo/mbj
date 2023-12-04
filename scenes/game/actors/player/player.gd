class_name Player extends CharacterBody3D

@onready var animation = $AnimationPlayer

@export var hp = 100
@export var speed = 5.0
@export var jump_force = 6
@export var gravity = 9.8

func _physics_process(delta):
	# Adicionar gravidade
	if not is_on_floor():
		velocity.y -= gravity * delta 

	# Pulo
	if Input.is_action_just_pressed("ui_accept"):
		jump()
	
	# UP = -z, DOWN = +Z, RIGHT = +x, LEFT = -x
	var input_dir =  Input.get_vector("ui_up","ui_down","ui_right","ui_left")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if direction.z > 0:
			animation.play("turn_right")
		elif direction.z < 0:
			animation.play("turn_left")
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		animation.queue("riding")
		velocity.x = move_toward(velocity.x, 0 , speed)
		velocity.z = move_toward(velocity.z, 0 , speed)

	move_and_slide()

func jump():
	if is_on_floor():
		animation.play("jump")
		velocity.y = jump_force
