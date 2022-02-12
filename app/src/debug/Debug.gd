extends Spatial


var cameraSwitch  = CameraSwitch.new()
var actionMap     = ActionMap.new()
var actionMapList = [
	{
		"action": "move_forward",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_W, KEY_UP, KEY_KP_8],
			InputEventJoypadButton: [13],
			InputEventJoypadMotion: {"axis": 1, "axis_value": 1.0}
		}
	},{
		"action": "move_backword",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_S, KEY_DOWN, KEY_KP_2],
			InputEventJoypadButton: [13],
			InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
		}
	},{
		"action": "move_left",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_A, KEY_LEFT, KEY_KP_4],
			InputEventJoypadButton: [13],
			InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
		}
	},{
		"action": "move_right",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_D, KEY_RIGHT, KEY_KP_6],
			InputEventJoypadButton: [13],
			InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
		}
	},{
		"action": "move_up",
		"deadzone": 0.5,
		"events": {InputEventKey: [KEY_SPACE]}
	},{
		"action": "move_down",
		"deadzone": 0.5,
		"events": {InputEventKey: [KEY_SHIFT]}
	},{
		"action": "ui_camera",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_C],
			InputEventMouse: [BUTTON_RIGHT],
		}
	}
]


func _init():
	actionMap.addActionMapList(actionMapList)


func _ready():
#	print(get_viewport().get_children()[1].get_children())
#	print(get_viewport().get_tree().to_string())
	add_child(cameraSwitch)
