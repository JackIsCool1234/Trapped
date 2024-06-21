extends CharacterBody2D

var destination = Vector2()
var distance = Vector2()

@export var speed = 250

func _ready():
	destination = position

func _process():
	

func _input(event):
	if Input.is_action_pressed("ui_leftMouseClick"):
		destination = get_global_mouse_position()
