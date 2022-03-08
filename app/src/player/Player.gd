extends Spatial


#var velocity  := Vector3()
var angular_velocity: float = 2.0
var radius_paddle:    float = 20
var radius_camera:    float = 16
var distance_camera:  float = 40
var is_center_look:   bool  = true

var ball:   RigidBody
var paddle: StaticBody

onready var rotor  := $Rotor
onready var camera := $Rotor/Camera


#func _init():
#	pass


func _enter_tree():
	ball   = $Ball
	paddle = $Rotor/Paddle
	
	ball.player   = self
	paddle.player = self


func _ready():
	paddle.transform.origin = Vector3(0, -radius_paddle, 0)
	camera.transform.origin = Vector3(0, -radius_camera, distance_camera)
	ball.transform.origin   = paddle.transform.origin + paddle.ball_position.transform.origin #Vector3(0, paddle.ball_position, 0)
	#print(to_global(paddle.ball_position.transform.origin))
	#ball.global_transform.origin = paddle.transform.origin + paddle.ball_position.transform.origin
	pass


#func _physics_process(_delta):
#	transform = transform.orthonormalized()
#	pass


func _process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angular_velocity * delta * motion.x)
			rotor.transform = rotor.transform.orthonormalized()
	
	if is_center_look:
		camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))
