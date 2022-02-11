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


func _init():
	actionMap.addActionList(actionList)
	pass


func _ready():
	print(get_viewport().get_children()[1].get_children())
	print(get_viewport().get_tree().to_string())
	add_child(cameraSwitch)
