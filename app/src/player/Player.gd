extends Spatial


const MOUSE_SENSITIVITY = 0.002
const MOVE_SPEED = 0.6

var radius: float = 10
var angularVelocity
var angularAcceleration
var rotationSpeed

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
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	# Mouse look (only if the mouse is captured).
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# Horizontal mouse look.
		rotate.y -= event.relative.x * MOUSE_SENSITIVITY
		# Vertical mouse look.
		rotate.x = clamp(rotate.x - event.relative.y * MOUSE_SENSITIVITY, -1.57, 1.57)
		transform.basis = Basis(rotate)
	
	if event.is_action_pressed("toggle_mouse_capture"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
	
	# Normalize motion to prevent diagonal movement from being
	# `sqrt(2)` times faster than straight movement.
	motion = motion.normalized()
	
	velocity += MOVE_SPEED * delta * transform.basis.xform(motion)
	velocity *= 0.85
	translation += velocity
