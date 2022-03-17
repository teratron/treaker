class_name Player extends Spatial


var direction := Vector3()
#var velocity  := Vector3()
var angular_velocity: float = 2.0
var radius_paddle:    float = 20
var radius_camera:    float = 16
var distance_camera:  float = 40
var is_center_look := false
var is_ball_state  := false

onready var fsm    := $StateMachine
onready var rotor  := $Rotor
onready var camera := $Rotor/Camera
onready var paddle := $Rotor/Paddle
onready var ball   := $Ball

#var ball:   RigidBody
#var paddle: StaticBody

#func _enter_tree():
#	ball   = $Ball
#	paddle = $Rotor/Paddle
#	ball.player   = self
#	paddle.player = self


func _ready():
	camera.transform.origin = Vector3(0, -radius_camera, distance_camera)
	paddle.transform.origin = Vector3(0, -radius_paddle, 0)
	paddle.ball_position.transform.origin.y += ball.radius
	ball.transform.origin = paddle.transform.origin + paddle.ball_position.transform.origin
	
	#prints("player ", paddle.ball_position.transform.origin)


#func _physics_process(_delta):
#	transform = transform.orthonormalized()
#	pass


func _input(event):
	if !is_ball_state && (event is InputEventKey || InputEventMouseButton) && event.is_action_pressed("use_shot"):
		is_ball_state = ball.start()


func _process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angular_velocity * delta * motion.x)
			#rotor.transform = rotor.transform.orthonormalized()
			
			if !is_ball_state:
				#print(paddle.ball_position.global_transform)
				ball.transform = paddle.ball_position.global_transform
		
		if is_center_look:
			camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))
