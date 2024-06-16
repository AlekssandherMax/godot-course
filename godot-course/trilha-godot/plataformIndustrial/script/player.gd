extends CharacterBody2D

@export var speed = 4
@export_range(0, 1) var lerpVector = 0.1
@onready var sprite = %sprite

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _physics_process(delta):
	# Add the gravity.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	#velocity = direction * speed * 150
	
	var targetVelocity = direction * speed * 150
	velocity = lerp(velocity, targetVelocity, lerpVector)
	move_and_slide()
	var target_rotation = direction.x * 25
	sprite.rotation_degrees = lerp(sprite.rotation_degrees, target_rotation, lerpVector)
