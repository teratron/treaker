# Action Map List

```gdscript
func add_action_map_list(list) -> void:
```

Example:

```gdscript
var action_map_list = [
	{
		"action": "move_forward",
		"deadzone": 0.5,
		"events": {
			InputEventKey:          [KEY_W, KEY_UP, KEY_KP_8],
			InputEventMouseButton:  [BUTTON_LEFT],
			InputEventJoypadButton: [JOY_BUTTON_12, JOY_BUTTON_14],
			InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
		}
	},{
		"action": "move_backword",
		"deadzone": 0.5,
		"events": {
			InputEventKey:          KEY_S,
			InputEventMouseButton:  BUTTON_RIGHT,
			InputEventJoypadButton: JOY_BUTTON_13,
			InputEventJoypadMotion: {"axis": 1, "axis_value": 1.0}
		}
	}
]
```

or:

```gdscript
var action_map_item = {
	"action": "move_forward",
	"deadzone": 0.5,
	"events": {
		InputEventKey:          [KEY_W, KEY_UP],
		InputEventMouseButton:  [BUTTON_LEFT, BUTTON_RIGHT],
		InputEventJoypadButton: JOY_BUTTON_12,
		InputEventJoypadMotion: {"axis": 1, "axis_value": -1.0}
	}
}
```

### Keyboard

```gdscript
func add_action_key(action: String, code) -> void:
```

Example:

```gdscript
add_action_key("move_forward", [KEY_W, KEY_UP, KEY_KP_8])
# or
add_action_key("move_forward", KEY_W)
```

### Mouse button

```gdscript
func add_action_mouse_button(action: String, index) -> void:
```

Example:

```gdscript
add_action_mouse_button("move_forward", [BUTTON_LEFT, BUTTON_RIGHT])
# or
add_action_mouse_button("move_forward", BUTTON_LEFT)
```

### Joypad button

```gdscript
func add_action_joypad_button(action: String, index) -> void:
```

Example:

```gdscript
add_action_joypad_button("move_forward", [JOY_BUTTON_12, JOY_BUTTON_14])
# or
add_action_joypad_button("move_forward", JOY_BUTTON_12)
```

### Joypad motion

```gdscript
func add_action_joypad_motion(action: String, axis: int, axis_value: float) -> void:
```

Example:

```gdscript
add_action_joypad_motion("move_forward", 1, -1.0)
```