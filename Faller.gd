extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var activated = false
var wateTime = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	self.add_child(wateTime)
	

	wateTime.set_wait_time(0.5)
	wateTime.set_one_shot(true)
		

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fallTime():

		wateTime.set_wait_time(0.5)
		wateTime.start()
		yield(wateTime, "timeout")
		$Plank4.visible = false
		wateTime.start()
		yield(wateTime, "timeout")
		$Plank3.visible = false
		wateTime.start()
		yield(wateTime, "timeout")
		$Plank2.visible = false
		wateTime.start()
		yield(wateTime, "timeout")
		$Plank.visible = false
		
		wateTime.start()
		yield(wateTime, "timeout")
		$Shell.visible = false
		$CollisionShape2D.disabled = true
		wateTime.set_wait_time(5)
		wateTime.start()
		yield(wateTime, "timeout")
		$Plank4.visible = true
		$Plank3.visible = true
		$Plank2.visible = true
		$Plank.visible = true
		$Shell.visible = true
		$CollisionShape2D.disabled = false
		activated = false
		
	
		pass

func _on_Sensor_body_entered(body):
	if activated == false:		
		if body.name == "Player":
			activated = true
			fallTime()
		
	pass # Replace with function body.
