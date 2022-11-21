extends Node2D


var timeScale
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var timeScale = 1
	$"/root/MainHud".showtuff()
	pass # Replace with function body.
func setTimeScale(timeScaleSet):
	timeScale = timeScaleSet
	

func getTimeScale():
	return timeScale
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EndDoor_body_entered(body):
	get_tree().change_scene("res://MiscScenes/loadingScene2.tscn")
	pass # Replace with function body.


func _on_exit_body_entered(body):
	get_tree().change_scene("res://MiscScenes/loadingScene3.tscn")
	pass # Replace with function body.


func _on_exit2_body_entered(body):
	$"/root/MainHud".hideStuff()
	get_tree().change_scene("res://MiscScenes/loadingScene4.tscn")
	
	pass # Replace with function body.
