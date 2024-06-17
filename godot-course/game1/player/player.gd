extends CharacterBody2D

@export var speed: float = 3

@onready var sprite: Sprite2D = $Sprite2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

var input_vector: Vector2 = Vector2(0, 0)
var isRunning: bool = false
var isAttacking: bool = false
var attackColdown: float = 0

func _process(delta: float) -> void:
	readInput()
	if isAttacking:
		attackColdown -= delta
		if attackColdown <= 0.0:
			isAttacking = false
			isRunning = false
			animationPlayer.play("idle")
		pass
	
func _physics_process(delta: float) -> void:
	#To change velocity
	var target_velocity = input_vector * speed * 100.0
	if isAttacking:
		target_velocity *= 0.15
		
	velocity = lerp(velocity, target_velocity, 0.05)
	move_and_slide()
	
	#To update is running 
	var wasRunning = isRunning
	isRunning = not input_vector.is_zero_approx()
	
	#To play animation
	if not isAttacking:
		if wasRunning != isRunning:
			if isRunning:
				animationPlayer.play("run")
			else:
				animationPlayer.play("idle")
			pass
	
	#To flip sprite
	if input_vector.x > 0: 
		sprite.flip_h = false
		pass
	elif input_vector.x < 0:
		sprite.flip_h = true
		pass
	
	#Attack
	if Input.is_action_just_pressed("attack"):
		attack()
func readInput() -> void:
	
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down", 0.15)
		#deadzone 
	var deadzone = 0.15
	if abs(input_vector.x) < deadzone:
		input_vector.x = 0
	if abs(input_vector.y) < deadzone:
		input_vector.y = 0
		
func attack() -> void:
	
	if isAttacking: 
		return
	attackColdown = 0.6
	animationPlayer.play("attackSide1")
	
	isAttacking = true

