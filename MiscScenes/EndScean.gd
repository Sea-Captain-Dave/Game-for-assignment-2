extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	callnext()
	pass # Replace with function body.

func callnext():

	var wateTime = Timer.new()
	self.add_child(wateTime)
	wateTime.set_wait_time(10)
	wateTime.set_one_shot(true)
	wateTime.start()
	yield(wateTime, "timeout")
	get_tree().change_scene("res://MiscScenes/Credits.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
