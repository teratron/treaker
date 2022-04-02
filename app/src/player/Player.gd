class_name Player extends Spatial


var direction := Vector3.ZERO
#var velocity  := Vector3()
var angular_speed:   float = 2.0
var radius_paddle:   float = 20
var radius_camera:   float = 16
var distance_camera: float = 30
var is_center_look := false

onready var state  := $StateMachine
onready var rotor  := $Rotor
onready var camera := $Rotor/Camera
onready var paddle := $Rotor/Paddle
onready var ball   := $Ball


#https://kidscancode.org/godot_recipes/math/transforms/

#var direction = Vector3(1,0,0)
#var speed = 30
#
#func _physics_process(delta):
#    var local_velocity = direction * speed
#    var global_velocity = global_transform.basis.xform(local_velocity)
#
#    if Input.is_key_pressed(KEY_W):
#	linear_velocity = global_velocity


func _ready():
	# Раставляем по местам
	#yield(owner, "ready")
	camera.transform.origin = Vector3(0, -radius_camera, distance_camera)
	paddle.transform.origin = Vector3(0, -radius_paddle, 0)
	#paddle.set_ball_position(ball.radius)
	#ball.transform.origin = paddle.transform.origin + paddle.ball_position.transform.origin
	
	paddle.ball = Vector3(0, ball.radius, 0)
	ball.transform.origin = paddle.transform.origin + paddle.ball
	
	#prints(transform.basis, transform.basis.x + transform.basis.y)
	#prints("player", transform.basis.y, to_global(transform.basis.y))
	#prints("player", transform.origin, to_global(transform.origin))
	#direction = transform.
#	prints(transform)
#	prints(transform.xform(Vector3.ZERO))
#	prints(to_global(Vector3.ZERO))
#	prints(to_local(Vector3.ZERO))
	#prints(paddle.transform)
#	prints(ball.transform.origin, paddle.ball_position.transform.origin)
#	prints(paddle.transform.xform(paddle.ball_position.transform.origin)) ##
#	prints(rotor.transform.xform(paddle.ball_position.transform.origin))
#	prints(transform.xform(paddle.ball_position.transform.origin))
	#prints(ball.transform)
	


#func _physics_process(_delta):
#	if !ball.is_parked:
		#prints("player", ball.linear_velocity, to_global(ball.linear_velocity), ball.to_global(ball.linear_velocity))
		#prints("player", transform.basis.y, to_global(transform.basis.y)) #player (0, 20, 0) (-0.141314, 0.969846, 0.198566)
		#prints(ball.linear_velocity)
	#rotor.transform = rotor.transform.orthonormalized()


func _unhandled_input(event):
	if (event is InputEventKey || InputEventMouseButton) && event.is_action_pressed("use_shot"):
		if ball.is_parked:
			#prints(paddle.ball_position.transform.basis.y)
			ball.start(paddle.ball_position.transform.basis.y)
		else:
			ball.stop()


func _process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angular_speed * delta * motion.x)
			
			if ball.is_parked:
				#prints(ball.transform.origin)
				#prints(rotor.transform.basis, paddle.ball_position.transform.origin)
				ball.transform = Transform(rotor.transform.basis, paddle.ball_position.transform.origin)
		
		if is_center_look:
			camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))
