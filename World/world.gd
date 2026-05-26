extends Node3D

@onready var npc_spawn_timer: Timer = $NPCSpawnTimer

func _ready():
	npc_spawn_timer.autostart = true
	npc_spawn_timer.wait_time = 3.0
	npc_spawn_timer.start()
	%PathManager.spawn_random_npc()


func _on_npc_spawn_timer_timeout() -> void:
	%PathManager.spawn_random_npc()
