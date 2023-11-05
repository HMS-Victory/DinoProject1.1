extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_game_pressed():
	Global.resetVariables()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.
func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.



func _on_edit_name_pressed():
	Global.edit=true
	pass # Replace with function body.
func _on_edit_cancel_button_pressed():
	Global.edit=false
func _on_edit_success_button_pressed():
	Global.playerName=$editPlayerName.text
	Global.edit=false




func _on_choose_character_pressed():
	Global.chooseCharacter=true

func _on_choose_character_cancel_button_pressed():
	Global.chooseCharacter=false

func _on_choose_character_success_button_pressed():
	if(Global.index==1):
		Global.character='businessMan'
	elif(Global.index==2):
		Global.character='Athlete'
	elif(Global.index==3):
		Global.character='FatMerchant'
	else:
		print("Character does not exist!")
	Global.chooseCharacter=false

func _on_next_pressed():
	Global.index += 1

func _on_prev_pressed():
	Global.index -= 1
