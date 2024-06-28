extends CanvasLayer

@onready var timerLabel: Label = %timerLabel
@onready var meatLabel: Label = %meatLabel
@onready var moneyLabel: Label = %moneyLabel

var timeElapsed: float = 0
var meatCounter: int = 0
var moneyCounter: int = 0

func _ready():
	GameManager.player.meatCollected.connect(onMeatCollected)
	meatLabel.text = str(meatCounter)
	GameManager.player.moneyCollected.connect(onMoneyCollected)
	moneyLabel.text = str(moneyCounter)
	
func _process(delta:float):
	timeElapsed += delta
	var timeElapsedSecs: int = floori(timeElapsed)
	var seconds: int = timeElapsedSecs % 60
	var minutes: int = timeElapsedSecs / 60
	var hours: int = minutes / 60
	
	if hours >= 1:
		timerLabel.text = "%02d:%02d:%02d" % [hours, minutes, seconds]
	else:
		timerLabel.text = "%02d:%02d" % [minutes, seconds]
		
func onMeatCollected(regenerationValue:int) -> void:
	meatCounter += 1
	meatLabel.text = str(meatCounter)
	
func onMoneyCollected(moneyValue: int) -> void: 
	moneyCounter += 5
	moneyLabel.text = str(moneyCounter)
