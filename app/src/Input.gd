extends ActionMap


func _init():
	addActionMapList(
		[
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
				"events": {InputEventKey: KEY_SPACE}
			},{
				"action": "use_ability",
				"deadzone": 0.5,
				"events": {InputEventKey: KEY_SHIFT}
			},{
				"action": "ui_camera",
				"deadzone": 0.5,
				"events": {
					InputEventKey: KEY_C,
					InputEventMouseButton: BUTTON_RIGHT
				}
			},{
				"action": "toggle_mouse_capture",
				"deadzone": 0.5,
				"events": {InputEventKey: [KEY_ESCAPE, KEY_F10]}
			}
		]
	)
