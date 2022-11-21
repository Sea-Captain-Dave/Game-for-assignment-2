extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jar = false
var HDD = false
var CD = false
var touch = false

var score = 0 setget set_score
onready var deaths = 0 setget set_deaths

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/factory.play(0.0)

	
	pass # Replace with function body.
func hideStuff():
	$HUD/Score.visible = false
	$HUD/Deaths.visible = false
	$HUD/leftBot/Right.visible = false
	$HUD/leftBot/Left.visible = false
	$HUD/botRignt/Up.visible = false
	$HUD/botRignt/Down.visible = false
	$HUD/leftTop2/ZoomOut.visible = false
	$HUD/leftTop2/zoomIn.visible = false
	$HUD/Jar.visible = false
	$HUD/HDD.visible = false
	$HUD/CD.visible = false
	
func showtuff():
	$HUD/Score.visible = true
	$HUD/Deaths.visible = true
	pass
func hidePies():

	pass
	
	
func set_score(value):
	score = value
	$HUD/Score.set_text("Data Found:"+str(score)+"TB")
	pass
	
	
func set_deaths(value):
	deaths = value
	$HUD/Deaths.set_text("Opperating Unit-TR-"+str(deaths))
	
	pass

func enable_buttons():
	$HUD/leftBot/Right.visible = true
	$HUD/leftBot/Left.visible = true
	$HUD/botRignt/Up.visible = true
	$HUD/botRignt/Down.visible = true
	$HUD/leftTop2/ZoomOut.visible = true
	$HUD/leftTop2/zoomIn.visible = true
	$HUD/leftTop2/Pause.visible = true
	touch = true
	
func collectJar():
	$HUD/Jar.visible = true
	jar = true
func collectHDD():
	$HUD/HDD.visible = true
	HDD = true
func collectCD():
	$HUD/CD.visible = true
	CD = true
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if Input.is_action_pressed("ui_stop"):
		$HUD/botRignt/quit.visible = true
		$HUD/leftBot/resume.visible = true
		$HUD/leftTop2/Mute.visible = true
		$HUD/leftTop2/Pause.visible = false
		get_tree().paused = true
		
		

	pass # Replace with function body.


func _on_hammer_finished():
	$HUD/bloops.play(0.0)
	$HUD/hammer.stop()
	pass # Replace with function body.


func _on_bloops_finished():
	$HUD/factory.play(0.0)
	$HUD/bloops.stop()
	
	pass # Replace with function body.


func _on_factory_finished():
	$HUD/hammer.play(0.0)
	$HUD/factory.stop()
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_resume_pressed():
	var audio1 = $HUD/bloops.stream_paused 
	var audio2 = $HUD/factory.stream_paused
	var audio3 = $HUD/hammer.stream_paused
	
	get_tree().paused = false
	$HUD/bloops.stream_paused = audio1
	$HUD/factory.stream_paused = audio2
	$HUD/hammer.stream_paused = audio3
	$HUD/botRignt/quit.visible = false
	$HUD/leftBot/resume.visible = false
	$HUD/leftTop2/Mute.visible = false
	$HUD/leftTop2/Pause.visible = touch
	pass # Replace with function body.


func _on_Button_pressed():
	$HUD/bloops.stream_paused = !$HUD/bloops.stream_paused
	$HUD/factory.stream_paused = !$HUD/factory.stream_paused
	$HUD/hammer.stream_paused = !$HUD/hammer.stream_paused




func _on_UnMute_pressed():
	pass # Replace with function body.
