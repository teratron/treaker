extends Spatial


var velocity  = Vector3()
#var actionMap = ActionMap.new()


var angularVelocity: float = 0.5
var radiusPaddle:    float = 12
var radiusCamera:    float = 8
var distanceCamera:  float = 16
var isCenterLook:    bool  = false

onready var rotor  = $Rotor
onready var paddle = $"Rotor/Paddle"
onready var camera = $"Rotor/Camera"


#func _init():
#	Global.actionMap.addActionMapList(actionList)


func _ready():
	paddle.transform.origin = Vector3(0, -radiusPaddle, 0)
	camera.transform.origin = Vector3(0, -radiusCamera, distanceCamera)
	pass


func _physics_process(_delta):
	#transform = transform.orthonormalized()
	pass


func _process(delta):
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
		
		if motion != Vector3.ZERO:
			#prints(motion, motion.normalized())
		
			#rotor.transform.basis *= Basis(Vector3(0, 0, 1), angularVelocity * delta)
			rotor.transform.basis = rotor.transform.basis.rotated(Vector3(0, 0, 1), angularVelocity * delta * motion.x)
			#rotor.global_rotate(Vector3(0, 0, 1), delta * motion.x)
	
	#transform.basis = Basis(Vector3(0, 0, 1), MOVE_SPEED * PI*delta) * transform.basis
	#transform.basis = transform.basis.rotated(Vector3(0, 0, 1), MOVE_SPEED * PI*delta)
	#rotate(Vector3(1, 0, 0), PI*delta)
	#rotate_x(PI)
	#rotate_object_local(Vector3(0, 0, 1), MOVE_SPEED * PI*delta)
	
	if isCenterLook:
		camera.look_at(rotor.transform.origin, Vector3(0, 0, 1))
