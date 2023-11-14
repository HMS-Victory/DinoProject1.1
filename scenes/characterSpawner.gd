extends Area2D

var characterLoader
var _character

func _ready():
	if(Global.character=='Athlete'):
		characterLoader= preload("res://scenes/Athlete.tscn")
	elif (Global.character=='businessMan'):
		characterLoader=preload("res://scenes/businessMan.tscn")
	elif(Global.character=='FatMerchant'):
		characterLoader=preload("res://scenes/FatMerchant.tscn")
	
	_character= characterLoader.instantiate()
	_character.position = Vector2(0,0)
	add_child(_character)
		
func _process(_delta):
	pass


		
