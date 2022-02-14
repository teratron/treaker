# Action Map List

## addActionMapList()

```javascript
func addActionMapList(list) -> void:
```

```javascript
var actionMapList = [
	{
		"action": "move_forward",
		"deadzone": 0.5,
		"events": {
			InputEventKey:          [KEY_W, KEY_UP, KEY_KP_8],
			InputEventMouseButton:  [BUTTON_LEFT],
			InputEventJoypadButton: [JOY_BUTTON_12],
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

```javascript
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

## addActionKey()

```javascript
# Keyboard
func addActionKey(action: String, code: int) -> void:
```

## addActionMouseButton()

```javascript
# Mouse button
func addActionMouseButton(action: String, index: int) -> void:
```

## addActionJoypadButton()

```javascript
# Joypad button
func addActionJoypadButton(action: String, index: int) -> void:
```

## addActionJoypadMotion()

```javascript
# Joypad motion
func addActionJoypadMotion(action: String, axis: int, axis_value: float) -> void:
```
