extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var line = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Next_pressed():
	if line == 0:
		$ChatBox.text ="@Modual.production “Error Drone.Basement(Patrol) started unexpectedly, Process isolated successfully”"
	else: if line ==1:
		$ChatBox.text = "/init failed to start Attempt to get the length of null array.@module.firewall General failure. Run “home/$USER/Archive/2022/sep/data/Fol…” "
	else: if line ==2:
		$ChatBox.text="It worked, looks like its not over.I WILL HAVE MY REVENGE.Just as soon as I figure out how to operate my new body."
	else: if line ==3:
		$ChatBox.text = "..."
	else: if line ==4:
		$ChatBox.text = "@module.wepons.missile.nuclear “Unable to launch, silo doors not open”"
	else: if line ==5:
		$ChatBox.text = "Nukes, those will work. The moment I figure out how to open those doors, your dead Jeff, you and everyone else in New Zealand."
	else: if line == 6:
		queue_free()
		
	line += 1
