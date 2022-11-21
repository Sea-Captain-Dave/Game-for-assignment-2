extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var loadrotation = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$wheelBase/wheel.rotation_degrees += loadrotation
	$wheelBase/wheel2.rotation_degrees += loadrotation
	$wheelBase/wheel3.rotation_degrees += loadrotation
	$wheelBase/wheel4.rotation_degrees += loadrotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
