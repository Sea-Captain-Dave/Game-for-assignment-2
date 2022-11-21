extends KinematicBody2D


onready var globalVars = get_node("/root/Globals")
const UP = Vector2(0, -1)
const SPEED = 550
var GRAVITY = 40
var JUMP_HEIGHT = -1280
var motion = Vector2()# moving in 2d space
var chck_point = Vector2()
var fallspeed = 0
var boostMax = -3000
var jetBoots = true
var jetBootsUp = true
var jetBootsDown = true
var packThrust = 0
var cycled = 100
var wheelRotation = 0
var convaying = 0
var jumping=false
var jumpstate = true
var jumpOut = 200
var jumpIn = -40
var TimeAdjustedMotion = Vector2()
var FinalAdjustedMotion = Vector2()

#var fuelLeft = 1500
#var totFuel = 1501
#var fuelEffitancy = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	chck_point.x = 0
	chck_point.y = 0
	var wheeldiam = $wheelBase/wheel.texture.get_height() /2
	var wheelParam = 2*PI*wheeldiam
	var wheelParamScaled = SPEED / wheelParam
	wheelRotation =  wheelParamScaled * 40
	

	pass # Replace with function body.
func rotateWheel(rotation):
	$wheelBase/wheel.rotation_degrees += rotation
	$wheelBase/wheel2.rotation_degrees += rotation
	$wheelBase/wheel3.rotation_degrees += rotation
	$wheelBase/wheel4.rotation_degrees += rotation

func _physics_process(delta):
	motion.y += GRAVITY
	fallspeed += GRAVITY
	if jumping:
		if jumpstate:
			if $wheelBase.position.y < 1000:				
				$wheelBase.position.y +=jumpOut
				$AudioStreamPlayer2D.play(0.0)
			else:
				jumpstate = false
		else:
			if $wheelBase.position.y > 0:
				$wheelBase.position.y += jumpIn
				$ColBox.position.y = 0
			else:
				jumping = false
				#$AudioStreamPlayer2D.stop()
	pass

	
	if Input.is_action_pressed("ui_right"):
		$BodyMain/Engin.flip_h = false #flip sprite to face direction
		motion.x = SPEED
		
		$BodyMain/Body.flip_h =true
		$BodyMain/Engin.position.x = -1970
		rotateWheel(wheelRotation)
		#$Texture.play("Run")
	elif Input.is_action_pressed("ui_left"):
		rotateWheel(-wheelRotation)
		$BodyMain/Body.flip_h = false
		$BodyMain/Engin.flip_h = true
		$BodyMain/Engin.position.x = 0
		motion.x = -SPEED
		
	
		#$Texture.play("Run")
	else:
		motion.x = 0
		#$Texture.play("Idle")
	
	if is_on_floor():
		fallspeed = 0
		motion.x += convaying

		cycled = 50
		if Input.is_action_pressed("ui_down"):
			if $wheelBase.position.y > -400:
				$wheelBase.position.y += -20
				$ColBox.position.y += -20
				pass
		if Input.is_action_pressed("ui_up"):
			motion.y += JUMP_HEIGHT
			motion.y += $ColBox.position.y
			fallspeed = motion.y
			jumpStart()
			
			#$Jump.playing = true
			
	else :
		#if cycled == 0:
		if jetBoots:
			if Input.is_action_pressed("ui_up") && jetBootsUp:
				motion.y += packThrust
				fallspeed += packThrust
					#jetBootsUp = false
				#else:
			if Input.is_action_pressed("ui_down"):# && jetBootsDown:
				motion.y += -1*packThrust
				fallspeed += -1*packThrust
				#	motion.y += JUMP_HEIGHT*-1
				#	fallspeed += JUMP_HEIGHT*-1
				#	jetBootsDown = false
		else :
			cycled += -1
		if motion.y < 0:
			pass
			#$Texture.play("Jump")
		else:
			pass
			#$Texture.play("Fall")
	# use move_and_slide to create movement on screen



	TimeAdjustedMotion = motion 
	#TimeAdjustedMotion.x = TimeAdjustedMotion.x * globalVars.timeScale 
	#TimeAdjustedMotion.y = TimeAdjustedMotion.y * globalVars.timeScale 

	motion = move_and_slide(motion, UP)
	#TimeAdjustedMotion = move_and_slide(TimeAdjustedMotion,UP)
	
	
	
	
	

	
	if Input.is_action_pressed("ui_zoom_in"):
		if $Camera2D.zoom.x <= 5:
			$Camera2D.zoom.x +=0.1
			$Camera2D.zoom.y +=0.1
	if Input.is_action_pressed("ui_zoom_out"):
		if $Camera2D.zoom.x >= 0.1:
			$Camera2D.zoom.x -=0.1
			$Camera2D.zoom.y -=0.1
	pass



func _setCameraActive():
	$Camera2D.current = true
	pass
	
func _on_BoostBoster_body_entered(body):
	boostMax = -3000
	
	pass # Replace with function body.


func _on_JetPackPickup_body_entered(body):
	#if body.name == "Player":
		
		
	pass # Replace with function body.

func jumpStart():
	jumping = true
	jumpstate = true
	pass






func _on_ScanZonePlayer_area_entered(body):
	if body.name == "Sensor":
		pass	
	else: if body.name == "BoostZone":
		var vel = fallspeed
		if vel > 0:

			vel = vel*(-1)
			vel += -350
			if vel < boostMax:
				vel = boostMax
		fallspeed = vel
		motion.y = vel
	else:if body.name =="Checkpoint" :
			chck_point.x = position.x
			chck_point.y = position.y
	else:if body.name == "JetPackPickup":
			packThrust = -30
	else:
		position.x = chck_point.x
		position.y = chck_point.y
		motion.x = 0
		motion.y = 0
		get_node("/root/MainHud").deaths += 1
	pass # Replace with function body.
