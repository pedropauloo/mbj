class_name Player extends CharacterBody3D

@export var hp = 100
@export var speed = 5.0

func get_input():
	var input_dir = Vector3()

	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.z -= 1

	velocity = input_dir.normalized() * speed

func _process(delta):
	get_input()
	move_and_slide()
