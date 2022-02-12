extends Spatial


var cameraSwitch = CameraSwitch.new()
var actionMap    = ActionMap.new()
var actionList   = {
	"move_forward":  [KEY_W, KEY_UP,    KEY_KP_8],
	"move_backword": [KEY_S, KEY_DOWN,  KEY_KP_2],
	"move_left":     [KEY_A, KEY_LEFT,  KEY_KP_4],
	"move_right":    [KEY_D, KEY_RIGHT, KEY_KP_6],
	"move_up":       [KEY_SPACE],
	"move_down":     [KEY_SHIFT],
	"ui_camera":     [KEY_C]
}

#var a = {
#	"move_back": {
var move_back = {
		"deadzone": 0.5,
		"events": [
			{"device": InputEventKey,"code": [KEY_W, KEY_UP, KEY_KP_8]},
#			{"device": InputEventJoypadButton, "button_index": 13},
#			{"device": InputEventJoypadMotion,"axis": 1, "axis_value": 1.0}
		]
	}
#}


func moveBack():
	for i in move_back["events"]:
		print(i, move_back["events"])


func _init():
	actionMap.addActionList(actionList)
	moveBack()


func _ready():
	print(get_viewport().get_children()[1].get_children())
	print(get_viewport().get_tree().to_string())
	add_child(cameraSwitch)
