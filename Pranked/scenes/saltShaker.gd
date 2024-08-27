extends Node

@onready var area: Area2D = $Area2D

func _ready():
	area.input_event.connect(_on_input_event)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if Input.is_action_just_pressed('mouse_click'):
		print('clicked!')
