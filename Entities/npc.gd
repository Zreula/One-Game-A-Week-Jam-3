extends CharacterBody3D

var state_machine: StateMachine
var target_position: Vector3
var speed: float = 5.0
var etal_id: String

func _ready() -> void:
	pass

func set_target_position(pos: Vector3):
	var default_position = target_position
	if target_position == null:
		target_position = default_position
	target_position = pos

func _process(delta):
	if target_position != Vector3(0,0,0):
		global_transform.origin = global_transform.origin.move_toward(target_position, speed * delta)
