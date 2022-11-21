extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	var wateTime = Timer.new()
	self.add_child(wateTime)
	while true:
		wateTime.set_wait_time(5)
		wateTime.set_one_shot(true)

		wateTime.start()
		yield(wateTime, "timeout")
		
		$Burn.activateFlamer()
		
		wateTime.set_wait_time(5)
		wateTime.set_one_shot(true)
	
		wateTime.start()
		yield(wateTime, "timeout")
		
		$Burn.stopFlamer()
		
		
	pass # Replace with function body.

func headactiveFlamer():	



	
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
