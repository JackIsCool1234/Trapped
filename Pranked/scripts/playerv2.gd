extends CharacterBody2D


var destination = Vector2()
var distance = Vector2()
var snapPosition = Vector2()

var path : PackedVector2Array

@export var speed = 250

enum{idle, walk, interact, speak}

var state = idle

var margin = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	destination = position

func change_state(newState):
	state = newState
	match state: 
		idle:
			self.play("idle")
		walk:
			self.play("walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position != destination):
		distance = Vector2(destination - position)
		velocity.x = distance.normalized().x * speed
		velocity.y = distance.normalized().x * 0
		move_and_slide()
		
		if(distance.x * distance.x < margin):
			set_position(snapPosition)
		
	else:
		move_and_slide()	
		
	if(destination.x > position.x):
		get_node( "playerSprite" ).set_flip_h( false )
	if(destination.x < position.x):
		get_node( "playerSprite" ).set_flip_h( true )
			
		
	pass
	
# Original input for left mouse click, relocated to room script
#func _input(event): 
	#if Input.is_action_pressed("ui_leftMouseClick"):
		#destination = get_global_mouse_position()
		#snapPosition.x = destination.x
		#snapPosition.y = position.y
		
