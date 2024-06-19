class_name enemy

extends Node2D

@export var health: int = 10
@export var deathPrefab: PackedScene

func damage(amount: int):
	health -= amount
	print("Inimigo recebeu dano de ", amount, "e a vida atual é ", health)
	
	#damagesignal
	modulate = Color.RED
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "modulate", Color.WHITE, 0.3)
	
	
	#Process death
	if health <= 0:
		die()
		
func die() -> void:
	if deathPrefab:
		var deathObject = deathPrefab.instantiate()
		deathObject.position = position
		get_parent().add_child(deathObject)
		
	queue_free()
