class_name enemy

extends Node2D
@export_category("Life")
@export var health: int = 10
@export var deathPrefab: PackedScene

@onready var markDamage = $markDamage
var damageDigitPrefab: PackedScene

@export_category("Drops")
@export var dropChance: float = 0.1
@export var dropItens: Array[PackedScene]
@export var dropChances: Array[float]

func _ready():
	damageDigitPrefab = preload("res://events/damageDigit.tscn")

func damage(amount: int):
	health -= amount

	
	# Damage signal
	modulate = Color.RED
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "modulate", Color.WHITE, 0.3)
	
	var damageDigit = damageDigitPrefab.instantiate()
	damageDigit.value = amount
	if markDamage:
		damageDigit.global_position = markDamage.global_position
	else:
		damageDigit.global_position = global_position
	get_parent().add_child(damageDigit)
	
	# Process death
	if health <= 0:
		die()
		
func die() -> void:
	if deathPrefab:
		var deathObject = deathPrefab.instantiate()
		deathObject.position = position
		get_parent().add_child(deathObject)
		
	# Drop 
	if randf() <= dropChance:
		dropItem()
	
	#Counter
	GameManager.monstersDefeatedCounter += 1
	
	queue_free()

func dropItem() -> void:
	var drop = getRandomDropItem().instantiate()
	drop.position = position
	get_parent().add_child(drop)
	
func getRandomDropItem() -> PackedScene:
	if dropItens.size() == 1:
		return dropItens[0]
	var maxChance: float = 0
	for chance in dropChances:
		maxChance += chance
	
	var randomValue = randf() * maxChance
	
	var needle: float = 0
	for i in range(dropItens.size()):
		var dropItem = dropItens[i]
		var dropChance = dropChances[i] if i < dropChances.size() else 1
		if randomValue <= dropChance + needle:
			return dropItem
		needle += dropChance
	return dropItens[0]
