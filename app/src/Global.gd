extends Node


# Groups
const GROUP_CAMERA: String = "camera"
const GROUP_DEBUG:  String = "debug"


# Path
var actionMap = load("res://src/Input.gd").new()


func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event is InputEventKey && event.is_action_pressed("toggle_mouse_capture"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
