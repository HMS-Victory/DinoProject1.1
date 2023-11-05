extends Area2D


var beggerLoader = preload("res://scenes/begger.tscn")
var _begger

func _ready():
	$"Enemy Spawn Timer".start()

func _process(_delta):
	pass

func _on_enemy_spawn_timer_timeout():
	if Global.currentBeggers < Global.maxBeggers && Global.gameover == false:
		Global.currentBeggers += 1
		randomize()
		_begger= beggerLoader.instantiate()
		_begger.position = Vector2(randi_range(-400, 100), randi_range(-50, 50))
		add_child(_begger)
	Global._finalScore+= 1
	if !Global.gameover:
		$"Enemy Spawn Timer".start()
