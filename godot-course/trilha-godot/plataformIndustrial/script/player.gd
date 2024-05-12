extends CharacterBody2D


const SPEED = 450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _physics_process(delta):
	# Add the gravity.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up", "ui_down")
	velocity = direction * SPEED

	move_and_slide()
