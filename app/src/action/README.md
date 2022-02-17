# Action Map List

```gdscript
func addActionMapList(list) -> void:
```

Example:

```gdscript
var actionMapList = [
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
var actionMapItem = {
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
func addActionKey(action: String, code) -> void:
```

Example:

```gdscript
addActionKey("move_forward", [KEY_W, KEY_UP, KEY_KP_8])
# or
addActionKey("move_forward", KEY_W)
```

### Mouse button

```gdscript
func addActionMouseButton(action: String, index) -> void:
```

Example:

```gdscript
addActionMouseButton("move_forward", [BUTTON_LEFT, BUTTON_RIGHT])
# or
addActionMouseButton("move_forward", BUTTON_LEFT)
```

### Joypad button

```gdscript
func addActionJoypadButton(action: String, index) -> void:
```

Example:

```gdscript
addActionJoypadButton("move_forward", [JOY_BUTTON_12, JOY_BUTTON_14])
# or
addActionJoypadButton("move_forward", JOY_BUTTON_12)
```

### Joypad motion

```gdscript
func addActionJoypadMotion(action: String, axis: int, axis_value: float) -> void:
```

Example:

```gdscript
addActionJoypadMotion("move_forward", 1, -1.0)
```