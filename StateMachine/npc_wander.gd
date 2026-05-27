extends State
class_name NpcWander

@export var npc: CharacterBody3D
@export var move_speed: float = 3.0

func Enter():
	print("Entering wandering state")

func Exit():
	pass

@warning_ignore("unused_parameter")
func Update(delta: float):
	pass

func Physics_Update(_delta: float):
	if npc.global_position == npc.target_position:
		Transitioned.emit(self, "shopping")
