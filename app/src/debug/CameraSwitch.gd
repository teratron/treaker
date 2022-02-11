class_name CameraSwitch extends Node


var index:     int = -1
var lastIndex: int
var length:    int
var list:      Array


func _ready():
	list      = get_tree().get_nodes_in_group(Global.GROUP_CAMERAS)
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


func _input(event):
	if event is InputEventKey && event.pressed:
		if event.is_action_pressed("ui_camera"):
			list[index].current = false
			if index >= lastIndex:
				index = 0
			else:
				index += 1
			list[index].current = true
			
			print(list[index])
