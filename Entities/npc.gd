extends CharacterBody3D

var target_position: Vector3
var speed: float = 5.0
var path_progress: float
var etal_id: String
@onready var wait_time_timer: Timer = $WaitTimeTimer

func _ready() -> void:
	print(target_position)

func set_target_position(pos: Vector3):
	target_position = pos
	print("Target position given : ", pos)

func _process(delta):
	var pos_to_target = (target_position - self.global_position).length()
	if target_position != Vector3(0,0,0):
		global_transform.origin = global_transform.origin.move_toward(target_position, speed * delta)
	elif pos_to_target <= 0.5:
		is_at_target_pos()

func is_at_target_pos():
	wait_time_timer.wait_time = randf_range(1.0, 10.0)
	wait_time_timer.one_shot = true
	wait_time_timer.start()
	print("TIMER START")

func _on_wait_time_timer_timeout() -> void:
	NpcQueueManager.unregister_npc(self, etal_id)
	self.queue_free()
