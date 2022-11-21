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
		$ChatBox.text ="We live in the same computer\nyou kill me you die"
	else: if line == 1:
		queue_free()
		
	line += 1
