extends Node

const SAVEFILE="user://savefile.save"


var startCoins
var coins
var currentCoins
var maxCoins
var coinGain
var level
var gameover
var ongoingScore
var _finalScore
var HighestRecord=0
var cheatsEnabled
var playerName="Johannas"
var character="businessMan"


var dificultySpeed = -75
var spawnerSpeed = 0
var levelSpeedUp = -20
var speedUp = dificultySpeed * 0.6
var slowDown = dificultySpeed * -0.55
var gravity = 25
var groundJump = -725
var airJump = -100
var currentBeggers=0
var maxBeggers

#main menu var
var edit
var chooseCharacter
var index=1

func resetVariables():
	startCoins = 15
	coins = startCoins
	currentCoins = 0
	coinGain = 1
	currentBeggers = 0
	level = 1
	gameover = false
	ongoingScore = 0
	_finalScore = 0
	
	dificultySpeed = -75
	spawnerSpeed = 0
	levelSpeedUp = -20
	speedUp = dificultySpeed * 0.6
	slowDown = dificultySpeed * -0.55
	gravity = 25
	groundJump = -725
	airJump = -100
	
	cheatsEnabled=false
	edit=false;
	chooseCharacter=false
	

func _ready():
	load_score()
	resetVariables()
	#print("coins %s" % coins)
	pass

func _process(_delta):
	maxBeggers = level
	maxCoins = level
#James Code
	if coins <= 0 && !gameover:
		endGame()
		
func saveScore():
	var file=FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(HighestRecord)
func load_score():
	var file=FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		HighestRecord=file.get_32()




func endGame():
	gameover = true
	dificultySpeed=0
	_finalScore += ongoingScore
	if HighestRecord<=_finalScore:
		HighestRecord=_finalScore+1
	saveScore()
	
#End of James code





