extends CharacterBody2D

var destination = Vector2()
var distance = Vector2()

@export var speed = 250

var direction = 0

func _ready():
	destination = position

func _process(delta):
	if global_position.distance_to(destination) > 50:
		velocity.x = speed * direction

func _input(event):
	if Input.is_action_pressed("ui_leftMouseClick"):
		destination = get_global_mouse_position()
		if destination < global_position:
			direction = -1
		else:
			direction = 1
