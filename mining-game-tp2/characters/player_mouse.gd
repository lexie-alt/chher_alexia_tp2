extends CharacterBody2D

@export var move_speed : float = 100

func _physics_process(_delta): #time physic process update
	#input direction 
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), #positive value = right negative value = left
		Input.get_action_strength("down") - Input.get_action_strength("up") #positive value = down negative value = up
	)
	
	print(input_direction)
	#velocity update direction time speed movement
	velocity = input_direction * move_speed
	
	#move and slide function
	move_and_slide() #against wall will slide along wall or can use move and collide
