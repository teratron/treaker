extends Spatial


#var velocity  := Vector3()
var angular_velocity: float = 2.0
var radius_paddle:    float = 20
var radius_camera:    float = 16
var distance_camera:  float = 50
var is_center_look:   bool  = true

onready var rotor  := $Rotor
onready var paddle := $Rotor/Paddle
onready var camera := $Rotor/Camera


#func _init():
#	pass

func _enter_tree():
	$Ball.player = self


func _ready():
	paddle.transform.origin = Vector3(0, -radius_paddle, 0)
	camera.transform.origin = Vector3(0, -radius_camera, distance_camera)
	pass


#func _physics_process(_delta):
#	transform = transform.orthonormalized()
#	pass


func _process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			#rotor.global_rotate(Vector3(0, 0, 1), delta * motion.x)
			#rotor.transform.basis *= Basis(Vector3(0, 0, 1), angular_velocity * delta)
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angular_velocity * delta * motion.x)
			rotor.transform = rotor.transform.orthonormalized()
	
	if is_center_look:
		camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))
