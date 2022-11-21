extends KinematicBody2D

export var speed = 200 # Speed of the platform
onready var parent = get_parent() 

func _ready():
	pass # Replace with function body.

func _process(delta):
	# The parent is a pathfollow then use the path to move the platform
	#if parent is PathFollow2D: 
	parent.set_offset(parent.get_offset() + speed * delta)
	rotation_degrees += 2
	
		
	pass
