class_name Player extends Spatial


#var direction := Vector3.ZERO
#var velocity  := Vector3()
var angular_speed:   float = 2.0
var radius_paddle:   float = 20
var radius_camera:   float = 16
var distance_camera: float = 30
var is_center_look := false

onready var plane  := Plane(transform.basis.z, 0) setget set_plane#, get_plane
onready var rotor  := $Rotor
onready var camera := $Rotor/Camera
onready var paddle := $Rotor/Paddle
onready var ball   := $Ball
#onready var state  := $StateMachine


#https://kidscancode.org/godot_recipes/math/transforms/
#var direction = Vector3(1,0,0)
#var speed = 30
#
#func _physics_process(delta):
#	var local_velocity = direction * speed
#	var global_velocity = global_transform.basis.xform(local_velocity)
#
#	if Input.is_key_pressed(KEY_W):
#		linear_velocity = global_velocity


func _ready():
	camera.transform.origin = Vector3(0, -radius_camera, distance_camera)
	paddle.transform.origin = Vector3(0, -radius_paddle, 0)
	paddle.set_ball_position(ball.radius)
	ball_parked_position()
	ball.player = self


#func _physics_process(_delta):
	#prints(ball.transform.origin, ball.global_transform.origin)
	#rotor.transform = rotor.transform.orthonormalized()
	#transform = transform.orthonormalized()
	#transform = transform.scaled(scale)


func unhandled_input(event):
	if event is InputEventKey || InputEventMouseButton:
		if event.is_action_pressed("use_shot"):
			if ball.status == ball.PARKED:
				ball.start(transform.basis.xform(ball.transform.basis.y))
			
			if ball.status == ball.PAUSED:
				ball.pause()
		
		if event.is_action_pressed("ui_pause"):
			ball.pause()
		
		if event.is_action_pressed("ui_restart"):
			if ball.status != ball.PARKED:
				ball.reset()
				ball_parked_position()


func process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angular_speed * delta * motion.x)
			
			if ball.status == ball.PARKED:
				ball_parked_position()
		
		if is_center_look:
			camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))


func ball_parked_position() -> void:
	ball.transform.basis  = rotor.transform.basis
	ball.transform.origin = rotor.transform.xform(paddle.ball_position)


func set_plane(value) -> void:
	plane = value


#func get_plane() -> Plane:
#	return Plane(transform.basis.z, 0)
