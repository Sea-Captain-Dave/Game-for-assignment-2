extends KinematicBody2D

export var speed = 200 # Speed of the platform
onready var parent = get_parent() # Determine of the platform follows a path
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	# The parent is a pathfollow then use the path to move the platform
	#if parent is PathFollow2D: 
	parent.set_offset(parent.get_offset() + speed * delta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlatChecker_body_entered(body):
	if parent.name == "platmover":
		parent.set_offset(0)
	if parent.name == "platmover2":
		parent.set_offset(552)
	pass # Replace with function body.
