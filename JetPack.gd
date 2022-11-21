extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_JetPackPickup_body_entered(body):
	#sif body.name == "Player":
		
	queue_free()
		
	pass # Replace with function body.


func _on_JetPackPickup_area_entered(area):

	pass # Replace with function body.
