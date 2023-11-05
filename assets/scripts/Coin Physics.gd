extends CharacterBody2D



func _ready():
	pass 


func _process(_delta):
	move_and_slide()
	velocity.y += Global.gravity
	velocity.x = Global.dificultySpeed



func _on_coin_detector_body_exited(_body):
	if _body.is_in_group("Player"):
		print("coin was picked up")
		self.queue_free()


func _on_coin_detector_area_entered(_area:Area2D):
	if _area.is_in_group("Deleater"):
		Global.currentCoins -= 1
		print("coin was deleated")
		self.queue_free()
