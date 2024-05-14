extends CharacterBody2D

@export var speed = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _physics_process(delta):
	# Add the gravity.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	#velocity = direction * speed * 150
	
	var targetVelocity = direction * speed * 150
	velocity = lerp(velocity, targetVelocity, 0.5)
	move_and_slide()
