class_name CameraSwitcher extends Node


var index:     int = -1
var lastIndex: int
var length:    int
var list:      Array
#var listEvent: Array


func _ready():
	list      = get_tree().get_nodes_in_group(Global.GROUP_CAMERA)
	length    = len(list)
	lastIndex = length - 1
	var i = 0
	for node in list:
		if node is Camera && node.current:
			if index == -1:
				index = i
			else:
				node.current = false
		i += 1
	
#	if InputMap.has_action("toggle_camera"):
#		listEvent = InputMap.get_action_list("toggle_camera")


func _unhandled_input(event):
	#if InputMap.has_action("toggle_camera") && InputMap.action_has_event("toggle_camera", event):
	if (event is InputEventKey || event is InputEventMouseButton) && event.pressed:
		if event.is_action_pressed("toggle_camera"):
			list[index].current = false
			if index >= lastIndex:
				index = 0
			else:
				index += 1
			
			list[index].current = true
			print(list[index])
