extends CSGMesh3D
class_name Key

@onready var unstable_timer: Timer = $UnstableTimer
@export var player: CharacterBody3D
@export var shape: KEY_SHAPES
#region Mesh_preload

const key_1_mesh = preload("uid://cyucyn24d720e")
const key_2_mesh = preload("uid://c7e03nkhxpwvc")
const key_3_mesh = preload("uid://bb2lvu6djr0ek")
const key_4_mesh = preload("uid://c7oan7mn4etcy")
const key_5_mesh = preload("uid://000cdeb8bn2r")
const key_6_mesh = preload("uid://vglpv07mj4d0")
#endregion

var color: Color:
	set(new_color):
		color = new_color
		self.material.albedo_color = new_color

enum KEY_SHAPES {
	SHAPE1,
	SHAPE2,
	SHAPE3,
	SHAPE4,
	SHAPE5,
	SHAPE6
}

func _ready():
	player = get_tree().get_first_node_in_group("player")
	unstable_timer.start()
	self.material = StandardMaterial3D.new()
	shape = KEY_SHAPES.values().pick_random()
	set_key_shape()

func set_key_shape():
	match shape:
		KEY_SHAPES.SHAPE1:
			self.mesh = key_1_mesh
			self.color = Color(0.266, 0.537, 0.296, 1.0)
		KEY_SHAPES.SHAPE2:
			self.mesh = key_2_mesh
			self.color = Color(0.146, 0.529, 0.523, 1.0)
		KEY_SHAPES.SHAPE3:
			self.mesh = key_3_mesh
			self.color = Color(0.076, 0.506, 0.685, 1.0)
		KEY_SHAPES.SHAPE4:
			self.mesh = key_4_mesh
			self.color = Color(0.454, 0.319, 0.96, 1.0)
		KEY_SHAPES.SHAPE5:
			self.mesh = key_5_mesh
			self.color = Color(0.793, 0.108, 0.589, 1.0)
		KEY_SHAPES.SHAPE6:
			self.mesh = key_6_mesh
			self.color = Color(0.704, 0.36, 0.082, 1.0)


func _on_timer_timeout():
	var last_shape
	last_shape = shape
	shape = KEY_SHAPES.values().pick_random()
	if last_shape == shape:
		shape = KEY_SHAPES.values().pick_random()
	set_key_shape()
