extends ActionMap


var input_map = [
	{
		"action": "move_forward",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_W, KEY_UP, KEY_KP_8],
			InputEventJoypadButton: JOY_BUTTON_12,
			InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
		}
	},{
		"action": "move_backword",
		"deadzone": 0.5,
		"events": {
			InputEventKey: [KEY_S, KEY_DOWN, KEY_KP_2],
			InputEventJoypadButton: JOY_BUTTON_13,
			InputEventJoypadMotion: {"axis": 1, "axis_value": 1.0}
		}
	},{
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
		"action": "move_up",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_SPACE}
	},{
		"action": "move_down",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_SHIFT}
	},{
		"action": "use_shot",
		"deadzone": 0.5,
		"events": {
			InputEventKey: KEY_SPACE,
			InputEventMouseButton: BUTTON_LEFT
		}
	},{
		"action": "use_ability",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_ALT}
	},{
		"action": "ui_pause",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_P}
	},{
		"action": "ui_restart",
		"deadzone": 0.5,
		"events": {InputEventMouseButton: BUTTON_RIGHT}
	},{
		"action": "toggle_camera",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_C}
	},{
		"action": "toggle_mouse_captured",
		"deadzone": 0.5,
		"events": {InputEventKey: [KEY_ESCAPE, KEY_F10]}
	},{
		"action": "toggle_fullscreen",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_F11}
	},{
		"action": "toggle_debug_menu",
		"deadzone": 0.5,
		"events": {InputEventKey: KEY_TAB}
	},{
		"action": "click",
		"deadzone": 0.5,
		"events": {InputEventMouseButton: [BUTTON_LEFT, BUTTON_RIGHT]}
	}
]


func _init():
	add_action_map_list(input_map)
