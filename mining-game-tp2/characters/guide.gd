#extends Node2D

#@onready var interaction_area: InteractionArea = $InteractionArea
#const lines: Array[String] = [
	#"Hey there!"
#]

#func _ready():
#	interaction_area_interact = Callable(self, "_on_interact")
	
#func _on_interact():
#	DialogManager.start_dialog(global_position, lines, speech_sound)
	
	
#func _on_body_entered(body):
	#Interaction_Manager.register_area(self)


#func _on_body_exited(body):
	#Interaction_Manager.unregister_area(self)
