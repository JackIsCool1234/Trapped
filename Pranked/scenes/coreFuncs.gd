extends Control

var hover_cursor = preload("res://assests/cursor_select.png")
var null_cursor = preload("res://assests/cursor_grab.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_cursor_hand():
	Input.set_custom_mouse_cursor(hover_cursor)

func change_cursor_back():
	Input.set_custom_mouse_cursor(null)
