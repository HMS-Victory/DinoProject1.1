extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()
	text=Global.playerName
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.chooseCharacter && Global.edit:
		visible=true
	else:
		visible=false
