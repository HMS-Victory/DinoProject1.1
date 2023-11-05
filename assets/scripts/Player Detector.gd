extends Area2D


func _ready():
	pass 



func _process(_delta):
	pass


var randomUnhappy

@onready var unhappy1 = $unhappy1
@onready var unhappy2 = $unhappy2
@onready var unhappy3 = $unhappy3
@onready var unhappy4 = $unhappy4
@onready var unhappy5 = $unhappy5
@onready var coin = $coin
@onready var beggerTakes = $moneyStolen
@onready var crying = $cry


func _on_body_entered(_body):
	if _body.is_in_group("Begger"):
		randomUnhappy = randi_range(1, 5)
		beggerTakes.emitting = true
		crying.emitting = true

		if randomUnhappy == 1 && Global.coins <= Global.startCoins:
			unhappy1.play()
			coin.play()
		elif randomUnhappy == 2 && Global.coins <= Global.startCoins:
			unhappy2.play()
			coin.play()
		elif randomUnhappy == 3 && Global.coins <= Global.startCoins:
			unhappy3.play()
			coin.play()
		elif randomUnhappy == 4 && Global.coins <= Global.startCoins:
			unhappy4.play()
			coin.play()
		elif randomUnhappy == 5 && Global.coins <= Global.startCoins: 
			unhappy5.play()
			coin.play()

		#print("coins %s" % Global.coins)
