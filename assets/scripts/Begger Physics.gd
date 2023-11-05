extends CharacterBody2D



func _ready():
	pass 

var takenMoney = false

@onready var sprite = $"Begger Sprite"
@onready var ap = $rich



func _process(_delta):
	move_and_slide()
	velocity.y += Global.gravity
	if takenMoney == false:
		velocity.x = Global.dificultySpeed

	elif takenMoney == true:
		velocity.x = Global.dificultySpeed + -250
		sprite.rotation_degrees = -10


func _on_begger_detection_area_entered(_area:Area2D):
	if _area.is_in_group("Deleater"):
		Global.currentBeggers -= 1
		print("begger was deleated")
		self.queue_free()


func _on_begger_detection_body_entered(_body:Node2D):
	if _body.is_in_group("Player"):
		takenMoney = true
		ap.play("rich")
