extends CharacterBody3D

var target_position: Vector3
var speed := 2.0

func set_target_position(pos: Vector3):
	target_position = pos

func _process(delta):
	global_transform.origin = global_transform.origin.move_toward(target_position, speed * delta)
