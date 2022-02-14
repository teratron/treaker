extends Spatial


const MOUSE_SENSITIVITY = 0.002
const MOVE_SPEED = 0.6

var radius: float = 10
var angularVelocity
var angularAcceleration
var rotationSpeed
var isCenterLook: bool = false

var rotate    = Vector3()
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
	actionMap.addActionMapList(actionList)


func _ready():
	pass


func _process(delta):
	var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
	
	velocity += MOVE_SPEED * delta * transform.basis.xform(motion.normalized())
	velocity *= 0.85
	translation += velocity
