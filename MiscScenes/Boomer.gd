extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2()
const UP = Vector2(0, -1)
var boomable = false
var boomed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += 40
	motion = move_and_slide(motion, UP)
	if motion.y > 1000 :
		boomable = true
	if boomable == true:
		if is_on_floor():
			if boomed == false:
				boomed == true
				boomTime()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func boomTime():
	$barrel.visible = false 
	$boom.beginBoom()	
	var wateTime = Timer.new()
	self.add_child(wateTime)
	wateTime.set_wait_time(1)
	wateTime.set_one_shot(true)
	wateTime.start()
	yield(wateTime, "timeout")
	queue_free()
	

func _on_hitBox_area_entered(body):
	if body.name == "spikes":
		if boomed == false:
			boomed == true
			boomTime()

		

