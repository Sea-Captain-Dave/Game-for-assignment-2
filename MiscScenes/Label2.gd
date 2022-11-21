extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Throughout your journey you managed to aquire "+str($"/root/MainHud".score)+"TB of data,\n however "+str($"/root/MainHud".deaths)+" units were lost along the way \n \n \n"
	if $"/root/MainHud".jar == true or $"/root/MainHud".HDD == true or $"/root/MainHud".CD == true:
		text += "You also managed to aquire "
		if $"/root/MainHud".jar == true:
			text += " the jar ,"
		if $"/root/MainHud".HDD == true:
			text += " 1 hard drive "
		if $"/root/MainHud".CD == true:
			text += " a CD "
		text += "Along the way"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
