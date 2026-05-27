extends State
class_name NpcLeaving

@export var npc: CharacterBody3D
@export var move_speed: float = 3.0

func Enter():
	print("Entering leaving state")
	NpcQueueManager.unregister_npc(npc, npc.etal_id)
	await get_tree().process_frame
	npc.queue_free()

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass
