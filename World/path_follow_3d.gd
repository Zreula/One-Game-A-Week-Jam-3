extends PathFollow3D

@export var speed:float = 2.0
var npc_ahead: PathFollow3D = null
var min_distance: float = 1.5
var stop_progress: float = 50.0
#func _ready():
	#NpcQueueManager.register_npc(self)

func _process(delta):
	if npc_ahead:
		self.progress = min(npc_ahead.progress - 5, self.progress + delta * speed)
	else:
		self.progress += delta * speed
