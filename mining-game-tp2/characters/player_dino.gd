extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)

# parameters/Idle/blend_position

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(_delta): #time physic process update
	#input direction 
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), #positive value = right negative value = left
		Input.get_action_strength("down") - Input.get_action_strength("up") #positive value = down negative value = up
	)
	
	update_animation_parameters(input_direction)
	
	# print(input_direction)
	#velocity update direction time speed movement
	velocity = input_direction * move_speed
	
	#move and slide function
	move_and_slide() #against wall will slide along wall or can use move and collide
	
	pick_new_state()
	
func update_animation_parameters(move_input : Vector2):
		if(move_input != Vector2.ZERO):
			animation_tree.set("parameters/walk/blend_position", move_input)
			animation_tree.set("parameters/idle/blend_position", move_input)
			
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")		
