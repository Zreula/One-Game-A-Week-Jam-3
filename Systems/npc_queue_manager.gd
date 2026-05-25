extends Node

var npc_list: Array = []

func register_npc(npc: PathFollow3D):
	npc_list.append(npc)
	update_npc_list()

func unregister_npc(npc: PathFollow3D):
	npc_list.erase(npc)
	print("adieu")
	update_npc_list()

func update_npc_list():
	npc_list.sort_custom(func(a ,b): return a.progress < b.progress)
	for i in range(npc_list.size()):
		if i == 0:
			npc_list[i].npc_ahead = null
		else:
			npc_list[i].npc_ahead = npc_list[i - i]
