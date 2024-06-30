extends CanvasLayer
class_name GameOverUI
@onready var timeLabel: Label = %timeSurvived
@onready var monstersLabel: Label = %monstersDefeated

@export var restartDelay:float = 5
var restartCooldown: float 

func _ready():
	timeLabel.text = GameManager.timeElapsedString
	monstersLabel.text = str(GameManager.monstersDefeatedCounter)
	restartCooldown = restartDelay
func _process(delta):
	restartCooldown -= delta
	if restartCooldown <= 0:
		restartGame()
		
func restartGame():
	GameManager.reset()
	get_tree().reload_current_scene()
	
	pass
	
