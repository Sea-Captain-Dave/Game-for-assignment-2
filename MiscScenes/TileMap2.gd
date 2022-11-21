extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	loadNext()

func loadNext():
	var wateTime = Timer.new()
	self.add_child(wateTime)
	wateTime.set_wait_time(0.5)
	wateTime.set_one_shot(true)
	wateTime.start()
	yield(wateTime, "timeout")
	get_tree().change_scene("res://Level2.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
