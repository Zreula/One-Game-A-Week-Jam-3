extends Node

#region Path3D old script

#var npc_list: Array[PathFollow3D] = []
#
#func register_npc(npc: PathFollow3D):
	#npc_list.append(npc)
	#update_npc_list()
#
#func unregister_npc(npc: PathFollow3D):
	#npc_list.erase(npc)
	#update_npc_list()
#
#func update_npc_list():
	#for i in range(npc_list.size()):
		#if i == 0:
			#npc_list[i].npc_ahead = null
		#else:
			#npc_list[i].npc_ahead = npc_list[i - i]
#endregion

var queues: Dictionary = {}

func register_queue(etal_id: String, controller):
	queues[etal_id] = controller

func register_npc(npc, etal_id: String):
	queues[etal_id].add_npc(npc)

func unregister_npc(npc, etal_id: String):
	if queues.has(etal_id):
		queues[etal_id].remove_npc(npc)
