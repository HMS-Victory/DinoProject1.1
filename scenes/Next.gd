extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.chooseCharacter && !Global.edit:
		visible=true
		if(Global.index>=3):
			disabled=true
		else:
			disabled=false
	else:
		visible=false
	
