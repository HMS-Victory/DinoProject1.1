extends Label


func _ready():
	pass 


func _process(_delta):
	text=""
	if Global.gameover == true:
		text = ("Game over your final score is: " + str(Global._finalScore))
