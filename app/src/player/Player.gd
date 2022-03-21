class_name Player extends Spatial


var direction := Transform.IDENTITY
#var velocity  := Vector3()
var angular_velocity: float = 2.0
var radius_paddle:    float = 20
var radius_camera:    float = 16
var distance_camera:  float = 30
var is_center_look := false
var is_ball_state  := false

onready var state  := $StateMachine
onready var rotor  := $Rotor
onready var camera := $Rotor/Camera
onready var paddle := $Rotor/Paddle
onready var ball   := $Ball


func _ready():
	#prints(rotor.transform)
	#print(transform)
	# Раставляем по местам
	#yield(owner, "ready")
	camera.transform.origin = Vector3(0, -radius_camera, distance_camera)
	paddle.transform.origin = Vector3(0, -radius_paddle, 0)
	paddle.set_ball_position(ball.radius)
	ball.transform.origin = paddle.transform.origin + paddle.ball_position.transform.origin
	#prints(paddle.transform.origin, paddle.to_local(paddle.transform.origin), paddle.to_global(paddle.transform.origin))
	#prints(transform.origin, to_local(paddle.transform.origin), to_global(paddle.transform.origin))
	#prints(paddle.transform.origin, self.to_global(paddle.transform.origin), self.to_local(paddle.transform.origin))
	#prints(paddle.transform.origin, rotor.to_global(paddle.transform.origin), rotor.to_local(paddle.transform.origin))


#func _physics_process(_delta):
#	rotor.transform = rotor.transform.orthonormalized()


func _input(event):
	if !is_ball_state && (event is InputEventKey || InputEventMouseButton) && event.is_action_pressed("use_shot"):
		ball.start(paddle.ball_position.transform.basis.y)
		is_ball_state = true


func _process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			#prints(rotor.transform)
			#prints(ball.transform)
			#prints(rotor.transform.basis.y, paddle.ball_position.transform.basis.y)
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angular_velocity * delta * motion.x)
			#prints(rotor.transform.basis)
			#prints(rotor.transform.origin, paddle.transform.origin)
			#prints(rotor.transform.basis, rotor.to_global(Vector3.ZERO), rotor.to_local(rotor.to_global(Vector3.ZERO)))
			#prints(to_local(rotor.transform.origin), to_local(paddle.transform.origin))
			
			if !is_ball_state:
				#ball.transform = paddle.ball_position.transform
				#prints(paddle.transform.origin, rotor.to_global(paddle.transform.origin), rotor.to_local(paddle.transform.origin))
				ball.transform = Transform(rotor.transform.basis, rotor.to_local(paddle.ball_position.transform.origin))
		
		if is_center_look:
			camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))
