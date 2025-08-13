extends CharacterBody3D
@onready var camera_3d: Camera3D = $Camera3D


@export var character_mesh:PackedScene
var character:Node3D
var mouse_sens:=0.1
var pitch := 0.0
func _ready() -> void:
	character=character_mesh.instantiate()
	self.add_child(character)
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.rotate_y(deg_to_rad(-event.relative.x*mouse_sens))
		pitch -= event.relative.y * mouse_sens
		pitch = clamp(pitch, -25, 40)
		camera_3d.rotation_degrees.x = pitch
func _physics_process(delta: float) -> void:
	pass
