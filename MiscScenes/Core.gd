extends StaticBody2D

var life = 3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func dietime():
	var wateTime = Timer.new()
	self.add_child(wateTime)
	wateTime.set_wait_time(1)
	wateTime.set_one_shot(true)
	wateTime.start()
	yield(wateTime, "timeout")

	$dying.visible = false
	$dead.visible = true
	wateTime.set_wait_time(1)
	wateTime.start()
	yield(wateTime, "timeout")
	get_tree().change_scene("res://MiscScenes/EndScean.tscn")
	
	

func _on_spikes_area_entered(area):
	if area.name == "Sensor":
		life += -1
		if life == 1:
			$Sprite.visible = false		
			$dying.visible = true
			$endbox2.visible = true
		if life < 1:
			dietime()

			
