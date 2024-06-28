extends Node2D
@export var gameUi: CanvasLayer
@export var gameOverUiTemplate: PackedScene

func _ready():
	GameManager.gameOver.connect(triggerGameOver)
func triggerGameOver():
	if gameUi:
		gameUi.queue_free()
		gameUi = null 
	
	var gameOverUi: GameOverUI = gameOverUiTemplate.instantiate()
	
	add_child(gameOverUi)

