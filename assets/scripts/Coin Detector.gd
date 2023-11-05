extends Area2D


func _ready():
	pass 

@onready var coin1 = $coin1
@onready var coin2 = $coin2
@onready var coin3 = $coin3
@onready var coin4 = $coin4

var randomCoin


func _process(_delta):
	pass

func _on_body_entered(_body):
	if _body.is_in_group("Player"):
		Global.coins += Global.coinGain
		Global.currentCoins -= 1
		#print(Global.currentCoins)
		randomCoin = randi_range(1, 4)

		if randomCoin == 1:
			coin1.play()
		elif randomCoin == 2:
			coin2.play()
		elif randomCoin == 3:
			coin3.play()
		elif randomCoin == 4:
			coin4.play()

		#print("coins %s" % Global.coins)
