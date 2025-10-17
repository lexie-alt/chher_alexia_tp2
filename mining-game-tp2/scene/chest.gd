extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var sprites_2d: Sprite2D = $Sprite20

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	if sprites_2d.frame == 0:
		sprites_2d.frame = 1
		interactable.is_interactable = false
		print("the player a gained 10 or")
	
