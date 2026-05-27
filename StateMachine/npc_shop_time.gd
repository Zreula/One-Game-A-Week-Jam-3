extends State
class_name NpcShopTime

@export var npc: CharacterBody3D
@export var move_speed: float = 3.0


func Enter():
	print("Entering shopping state")
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.wait_time = randf_range(1,5)
	timer.start()
	timer.timeout.connect(_on_timer_time_out)

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

func _on_timer_time_out():
	Transitioned.emit(self, "leave")
