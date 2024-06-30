extends Node2D

@export var moneyAmount: int = 10

func _ready():
	$Area2D.body_entered.connect(bodyEntered)
	
func bodyEntered(body: Node2D): 
	if body.is_in_group("player"):
		var player: Player = body
		player.heal(moneyAmount)
		player.moneyCollected.emit(moneyAmount)
		queue_free()
