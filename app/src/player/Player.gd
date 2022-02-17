extends Spatial


const MOUSE_SENSITIVITY = 0.002
const MOVE_SPEED = 0.6

var distance: float = 10
var radius: float = 12
var angle: float = 5

var angularVelocity = 5
var angularAcceleration
var rotationSpeed
var isCenterLook: bool = false

var center: Vector3
var angle_pos  = Vector3()
var velocity  = Vector3()
var actionMap = ActionMap.new()
var actionList = [
	{
		"action": "move_left",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_A, KEY_LEFT, KEY_KP_4],
			InputEventJoypadButton: JOY_BUTTON_14,
			InputEventJoypadMotion: {"axis": 0, "axis_value": -1.0}
		}
	},{
		"action": "move_right",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_D, KEY_RIGHT, KEY_KP_6],
			InputEventJoypadButton: JOY_BUTTON_15,
			InputEventJoypadMotion: {"axis": 0, "axis_value": 1.0}
		}
	},{
		"action": "use_shot",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_SPACE}
	},{
		"action": "use_ability",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_SHIFT}
	}
]


func _init():
	center = Vector3(0, radius, -distance)
	actionMap.addActionMapList(actionList)


func _ready():
	print(transform)
	print(transform.basis)
	pass

func _physics_process(_delta):
	transform = transform.orthonormalized()

func _process(delta):
#	var strengthLeft  = Input.get_action_strength("move_left")
#	var strengthRight = Input.get_action_strength("move_right")
	#var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
	
	transform.basis = Basis(Vector3(0, 0, 1), MOVE_SPEED * PI*delta) * transform.basis
	#transform.basis = transform.basis.rotated(Vector3(0, 0, 1), MOVE_SPEED * PI*delta)
	
	#rotate(Vector3(1, 0, 0), PI*delta)
	#rotate_x(PI)
	
	#rotate_object_local(Vector3(0, 0, 1), MOVE_SPEED * PI*delta)
	
	
	#print(angle_pos)
	#angle_pos += angle * delta * motion.normalized()
	
	#velocity += MOVE_SPEED * delta * motion
	#velocity += velocity.rotated(Vector3(0,0,1), deg2rad(angle * delta)) * motion.normalized()
	
	
	#velocity *= 0.85
	#translation += velocity
	
	if isCenterLook:
		$Camera.look_at(center, Vector3(0, 1, 0))
