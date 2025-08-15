extends CharacterBody3D
@onready var camera_3d: Camera3D = $Camera3D
@export var gravity:=20.0
@export var speed:=10.0
@export var character_mesh:PackedScene
var character:Node3D
var mouse_sens:=0.1
var pitch := 0.0
const MENU = preload("res://UI/menu.tscn")
func _ready() -> void:
	character=character_mesh.instantiate()
	self.add_child(character)
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	GameManager.game_started.connect(start_game)
	GameManager.game_stoped.connect(stop_game)
	GameManager.start_game()
	var menu=MENU.instantiate()
	self.add_child(menu)
func start_game():
	self.set_physics_process(true)
func stop_game():
	print("çık")
	self.set_physics_process(false)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.rotate_y(deg_to_rad(-event.relative.x*mouse_sens))
		pitch -= event.relative.y * mouse_sens
		pitch = clamp(pitch, -25, 40)
		camera_3d.rotation_degrees.x = pitch
	elif event.is_action_pressed(&"cancel"):
		Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
		GameManager.stop_game()
func _physics_process(delta: float) -> void:
	var input_direction_2D:=Input.get_vector(&"walk-right",&"walk-left",&"walk-back",&"walk-front")
	var input_direction_3D:=Vector3(
		input_direction_2D.x,0.0,input_direction_2D.y
	)
	var direction:=transform.basis*input_direction_3D
	velocity.x=direction.x*speed
	velocity.z=direction.z*speed
	velocity.y-=gravity*delta
	if is_on_floor() and Input.is_action_just_pressed(&"jump"):
		velocity.y=gravity/2
	elif Input.is_action_just_released(&"jump") and velocity.y>0.0:
		velocity.y=0
	move_and_slide()
