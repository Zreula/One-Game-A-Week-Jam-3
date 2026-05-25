extends PathFollow3D

@export var speed:float = 5.0
var stop_position:float = 25.0
var min_distance:float = 2.0
const NPC = preload("uid://ci6s0c5uker67")

var npc_ahead: PathFollow3D

func _ready():
	NpcQueueManager.register_npc(self)
	


func _process(delta):
	if npc_ahead:
		self.progress = min(npc_ahead.progress - 5, self.progress + delta * speed)
		print(npc_ahead)
	else:
		self.progress += delta * speed
