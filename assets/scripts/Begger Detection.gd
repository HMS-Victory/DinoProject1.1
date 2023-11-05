extends Area2D


func _ready():
	pass 



func _process(_delta):
	pass

@onready var begger1 = $begger1
@onready var begger2 = $begger2
@onready var begger3 = $begger3
@onready var begger4 = $begger4
@onready var begger5 = $begger5
@onready var begger6 = $begger6

var randomUnhappy

func _on_body_entered(_body):
	if _body.is_in_group("Player"):
		Global.coins -= 5
		randomUnhappy = randi_range(1, 5)

		if randomUnhappy == 1 && Global.coins > Global.startCoins:
			begger1.play()
		elif randomUnhappy == 2 && Global.coins > Global.startCoins:
			begger2.play()
		elif randomUnhappy == 3 && Global.coins > Global.startCoins:
			begger3.play()
		elif randomUnhappy == 4 && Global.coins > Global.startCoins:
			begger4.play()
		elif randomUnhappy == 5 && Global.coins > Global.startCoins:
			begger5.play()

		#print("coins %s" % Global.coins)
