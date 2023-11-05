extends Area2D


var coinLoader = preload("res://scenes/coin.tscn")
var _coin

func _ready():
	$"Timer".start()

func _process(_delta):
	pass



func _on_timer_timeout():
	if Global.currentCoins < Global.maxCoins && Global.level > 3 && Global.gameover == false:
		_coin = coinLoader.instantiate()
		_coin.position = Vector2(randi_range(-300, 100), randi_range(-50, 50))
		add_child(_coin)
		Global.currentCoins += 1
