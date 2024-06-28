extends Node

var mobsPerMinute:float = 60
@export var initialSpawnRate: float = 60
@export var mobsInreasedPerMinute: float = 30
@export var waveDuration: float = 20
@export var breakIntensity: float = 0.5


var time: float = 0 

func _process(delta: float):
	time += delta
	#Linear difficult (green line)
	var sinWave = sin((time * TAU)/waveDuration)
	#Wave System (pink line)
	var waveFactor = remap(sinWave, -1, 1, breakIntensity, 1)
	var spawnRate = initialSpawnRate + mobsInreasedPerMinute * time
	
	spawnRate += waveFactor
	
	mobsPerMinute = spawnRate
	print(mobsPerMinute)
