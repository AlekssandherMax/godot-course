class_name mobSpawner
extends Node2D

@export var initialSpawnRate: float = 60
@export var mobsInreasedPerMinute: float = 30
@export var waveDuration: float = 20
@export var breakIntensity: float = 0.5
var time: float = 0 

@export var creatures: Array[PackedScene]

@onready var pathFollow2d: PathFollow2D = %PathFollow2D
var mobsPerMinute: float = 60.0
var coldown: float = 0
func _process(delta: float ):
	
	if GameManager.isGameOver: return 
	
	coldown -= delta
	if coldown > 0: return
	
	var interval = 60 / mobsPerMinute
	coldown = interval
	
	var point = getPoint()
	var worldState = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = point
	parameters.collision_mask = 0b100
	
	var result: Array = worldState.intersect_point(parameters, 1)
	if not result.is_empty(): return
		
	var index = randi_range(0, creatures.size() -1)
	var creatureScene = creatures[index]
	var creature = creatureScene.instantiate()
	position = GameManager.playerPosition
	creature.global_position = point
	get_parent().add_child(creature)
	
	#Difficult system
	time += delta
	#Linear difficult (green line)
	var sinWave = sin((time * TAU)/waveDuration)
	#Wave System (pink line)
	var waveFactor = remap(sinWave, -1, 1, breakIntensity, 1)
	var spawnRate = initialSpawnRate + mobsInreasedPerMinute * (time / 60.0)
	
	spawnRate += waveFactor
	
	mobsPerMinute = spawnRate
	
	
func getPoint() -> Vector2:
	pathFollow2d.progress_ratio = randf()
	return pathFollow2d.global_position
