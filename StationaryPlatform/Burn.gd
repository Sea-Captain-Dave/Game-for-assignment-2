extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activateFlamer():
	visible = true
	$FireZone.monitoring = true
	$FireZone.monitorable = true
	pass

func stopFlamer():
	visible = false
	$FireZone.monitoring = false
	$FireZone.monitorable = false

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
