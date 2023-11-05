extends Area2D



func _ready():
	pass 



func _process(_delta):
	pass


func _on_body_entered(_body):
	if _body.is_in_group("Player"):
		Global.endGame() #james code
