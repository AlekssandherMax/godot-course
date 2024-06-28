extends Node

@export var speed: float = 2.0
#@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var Enemy: enemy
var sprite: AnimatedSprite2D



func _ready():
	Enemy = get_parent()
	sprite = Enemy.get_node("AnimatedSprite2D")
	

func _physics_process(delta):
	
	var playerPosition = GameManager.playerPosition
	var difference = playerPosition - Enemy.position
	var inputVector = difference.normalized()
	
	Enemy.velocity = inputVector * speed * 100.0
	Enemy.move_and_slide()
	
	if inputVector.x > 0:
		sprite.flip_h = false
	elif inputVector.x < 0:
		sprite.flip_h = true
	print("A velocidade é",speed)
