extends Node3D

@onready var npc_spawn_timer: Timer = $NPCSpawnTimer

func _ready():
	npc_spawn_timer.autostart = true
	npc_spawn_timer.wait_time = 0.5
	npc_spawn_timer.start()



func _on_npc_spawn_timer_timeout() -> void:
	%PathManager.spawn_random_npc()
