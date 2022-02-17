extends Node


# Groups
const GROUP_CAMERA: String = "camera"
const GROUP_DEBUG:  String = "debug"


# Path
#var CameraSwitch = load("res://src/debug/CameraSwitch.gd")
#var ActionMap    = load("res://src/action/ActionMap.gd")


func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event.is_action_pressed("toggle_mouse_capture"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
