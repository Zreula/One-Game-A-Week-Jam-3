extends Node3D

@export var etal_id: String
@export var slots: Array[Marker3D]

var queue: Array = []

func _ready():
	NpcQueueManager.register_queue(etal_id, self)

func add_npc(npc):
	if queue.size() >= slots.size():
		return
	queue.append(npc)
	_update_positions()

func remove_npc(npc):
	queue.erase(npc)
	_update_positions()

func _update_positions():
	for i in range(min(queue.size(), slots.size())):
		queue[i].set_target_position(slots[i].global_transform.origin)


func _on_queue_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("npc"):
		NpcQueueManager.register_npc(body, etal_id)
