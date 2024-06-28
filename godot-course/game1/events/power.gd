extends Node2D

@export var damageAmount: int = 3
@onready var area2d: Area2D = $Area2D

func dealDamage():
	var bodies = area2d.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("enemies"):
			var Enemy: enemy = body
			Enemy.damage(damageAmount)
			
	print("power damage")
