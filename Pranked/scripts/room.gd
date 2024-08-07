extends Control

enum{idle, walk, interact, speak}

@onready var nav2D : NavigationRegion2D = $NavigationRegion2D
@onready var line2D : Line2D = $Line2D
@onready var Player : AnimatedSprite2D = $AnimatedSprite2D

func _input(event): 
	if !Input.is_action_pressed("ui_leftMouseClick"):
		return

	var new_path = nav2D.get_simple_path( self.get_global_position(), get_global_mouse_position())
	
	line2D.points = new_path 
	
	Player.path = new_path
	Player.change_state(walk)
