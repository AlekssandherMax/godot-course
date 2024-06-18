extends Node
@export var speed: float = 1
#@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var enemy: enemy
var sprite: AnimatedSprite2D



func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")
	pass

func _physics_process(delta):
	
	var playerPosition = GameManager.playerPosition
	var difference = playerPosition - enemy.position
	var inputVector = difference.normalized()
	
	enemy.velocity = inputVector * speed * 100
	enemy.move_and_slide()
	
	if inputVector.x > 0:
		sprite.flip_h = false
	elif inputVector.x < 0:
		sprite.flip_h = true
	
