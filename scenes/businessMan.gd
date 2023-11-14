extends CharacterBody2D

@onready var ap = $Animations
@onready var sprite = $Sprite2D
@onready var running = $running
@onready var coin = $coin
@onready var jumping1 = $jumping1
@onready var jumping2 = $jumping2
@onready var jumping3 = $jumping3
@onready var jumping4 = $jumping4
@onready var dragging = $dragging
@onready var wind = $wind
@onready var spendToJump = $moneyJumping
@onready var skidding = $skidding
@onready var run = $run
@onready var jump = $jump


func _physics_process(delta):	
	print("running")
	move_and_slide()
	velocity.y += Global.gravity 

	if !Global.gameover:
		print('physics is not working')
		#ifs for player physics
		if Input.is_action_just_pressed("Speed"): #if statment for movement
			Global.dificultySpeed += Global.speedUp
			print('speed should work')
		elif Input.is_action_just_released("Speed"):
			Global.dificultySpeed -= Global.speedUp
		elif Input.is_action_just_pressed("Slow"):
			Global.dificultySpeed  += Global.slowDown
		elif Input.is_action_just_released("Slow"):
			Global.dificultySpeed -= Global.slowDown
		elif Input.is_action_just_pressed("Jump") && is_on_floor():
			velocity.y += Global.groundJump
		elif Input.is_action_just_pressed("Jump") && !is_on_floor():
			velocity.y += Global.airJump
		elif Input.is_action_just_pressed("Throw") && !is_on_floor():
			velocity.y += Global.groundJump
			#allows you to keep jumping infinitely
			if !Global.cheatsEnabled:
				Global.coins -= 1
			#print("coins %s" % Global.coins)
		elif Input.is_action_just_pressed("cheats"):
			Global.cheatsEnabled=true
		else:
			Global.dificultySpeed = Global.dificultySpeed
		pass

		#ifs for animations
		if  Input.is_action_just_pressed("Jump") && is_on_floor():
			ap.play("Jumping")
		elif Input.is_action_just_pressed("Jump") && !is_on_floor():
			ap.play("Jumping")
		elif Input.is_action_just_pressed("Throw") && !is_on_floor():
			ap.play("Jumping")
		elif is_on_floor(): 
			ap.play("Running")
		if Input.is_action_pressed("Speed"):
			sprite.rotation_degrees = 7.5
		elif Input.is_action_just_released("Speed"):
			sprite.rotation_degrees = 0
		elif Input.is_action_pressed("Slow"):
			sprite.rotation_degrees = -7.5
		elif Input.is_action_just_released("Slow"):
			sprite.rotation_degrees = 0
		
		#ifs for particles
		if Input.is_action_just_pressed("Throw") && !is_on_floor():
			spendToJump.emitting = true
		elif Input.is_action_pressed("Slow") && is_on_floor():
			skidding.emitting = true
		elif Input.is_action_pressed("Speed") && is_on_floor():
			run.emitting = true
		elif Input.is_action_pressed("Jump") && is_on_floor():
			jump.emitting = true
		elif Input.is_action_pressed("Jump") && Input.is_action_pressed("Speed"):
			jump.emitting = true
		elif Input.is_action_pressed("Jump") &&  Input.is_action_pressed("Slow"):
			jump.emitting = true

		#ifs for sounds
		if  Input.is_action_just_pressed("Jump") && is_on_floor():
			jumping1.play()
		elif Input.is_action_just_pressed("Jump") && !is_on_floor():
			jumping2.play()
		elif Input.is_action_just_pressed("Throw") && !is_on_floor():
			coin.play()
			jumping4.play()
		elif !is_on_floor(): 
			running.play()

