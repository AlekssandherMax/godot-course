extends Node2D

@export var regenerationAmount: int = 10

func _ready():
	$Area2D.body_entered.connect(bodyEntered)
	
func bodyEntered(body: Node2D): 
	if body.is_in_group("player"):
		var player: Player = body
		player.heal(regenerationAmount)
		player.meatCollected.emit(regenerationAmount)
		queue_free()
