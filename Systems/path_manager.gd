extends Node

@export var paths: Array[Path3D]
@export var npc_scene: PackedScene

func spawn_random_npc():
	var index = [0,1,2,3,4,5].pick_random()
	var path = paths[index]
	var path_follow := PathFollow3D.new()
	path_follow.set_script(load("uid://c7b5p8u14yk71"))
	path.add_child(path_follow)
	path_follow.progress = 0.0
	path_follow.loop = false
	var npc = npc_scene.instantiate()
	npc.etal_id = str(index)
	path_follow.add_child(npc)
