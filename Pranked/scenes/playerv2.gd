extends CharacterBody2D


var destination = Vector2()
var distance = Vector2()
var snapPosition = Vector2()

#var path : PackedVector2Array

@export var speed = 75
@onready var _animation = $playerSprite

#enum{idle, walk, interact, speak}

#var state = idle

var margin = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	destination = position

# Movement
#func _process(delta):
	#var move_distance = speed * delta 
	#match state:
		#idle:
			#pass
		#walk:
			#move_along_path(move_distance)
	#pass		

## Declaring move_along_path function
#func move_along_path(distance):
	#var starting_point : = position 
	#if(starting_point.x < path[0].x):
		#self.set_flip_h( false )
	#if(starting_point.x > path[0].x):
		#self.set_flip_h( true )
	#for i in range(path.size()):
		#var distance_to_next : = starting_point.distance_to(path[0])
		#if (distance <= distance_to_next):
			#position = starting_point.lerp(path[0], distance / distance_to_next) 
			#break
		#path.remove_at(0)
		#if(path.size() == 0):
			#change_state(idle)
	#pass
#
## Change in animation and idle and walking stages
#func change_state(newState):
	#state = newState
	#match state: 
		#idle:
			#self.play("idle")
		#walk:
			#self.play("walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocity.x != 0:
		_animation.play("walk")
	else:
		_animation.play("idle")
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
func _input(event): 
	if Input.is_action_pressed("ui_leftMouseClick"):
		destination = get_global_mouse_position()
		snapPosition.x = destination.x
		snapPosition.y = position.y
		
