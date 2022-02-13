# Action Map List

```javascript
var actionMapList = [
	{
		"action": "move_forward",
		"deadzone": 0.5,
		"events": {
			InputEventKey:          [KEY_W, KEY_UP, KEY_KP_8],
			InputEventMouse:        [BUTTON_LEFT],
			InputEventJoypadButton: [JOY_BUTTON_0],
			InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
		}
	},{
		"action": "move_backword",
		"deadzone": 0.5,
		"events": {
			InputEventKey:          KEY_S,
			InputEventMouse:        BUTTON_RIGHT,
			InputEventJoypadButton: JOY_BUTTON_1,
			InputEventJoypadMotion: {"axis": 1, "axis_value": 1.0}
		}
	}
]
```
