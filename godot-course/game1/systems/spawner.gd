extends Node2D

@export var creatures: Array[PackedScene]
@export var freq: float = 60
@onready var pathFollow2d: PathFollow2D = %PathFollow2D

var coldown: float = 0
func _process(delta: float ):
	
	coldown -= delta
	if coldown > 0: return
	
	var interval = 60 / freq
	coldown = interval
	
	var index = randi_range(0, creatures.size() -1)
	var creatureScene = creatures[index]
	var creature = creatureScene.instantiate()
	
	creature.global_position = getPoint()
	get_parent().add_child(creature)
	
	pass
	
func getPoint() -> Vector2:
	pathFollow2d.progress_ratio = randf()
	return pathFollow2d.global_position
