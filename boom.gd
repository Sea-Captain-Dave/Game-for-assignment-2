extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func beginBoom():

	visible = true
	$smoke.visible = true
	$blast.monitorable = true
	$blast.monitoring = true

