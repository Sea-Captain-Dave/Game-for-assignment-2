extends KinematicBody2D

export var speed = 200 # Speed of the platform
onready var parent = get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	# The parent is a pathfollow then use the path to move the platform
	#if parent is PathFollow2D: 

	rotation_degrees += 2
	
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
