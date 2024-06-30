extends Node

@export var objectsTemplates: Array[PackedScene]

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				spawnObject(event.position)
				
func spawnObject(position: Vector2):
	var index: int = randi_range(0, objectsTemplates.size() -1)
	var objectTemplate = objectsTemplates[index]
	var object: RigidBody2D = objectTemplate.instantiate()
	object.position = position
	print(position)
	add_child(object)
	
