class_name CameraSwitch extends Node


var ind:      int = -1
var last_ind: int
var length:   int
var list:     Array


func _ready():
	list     = get_tree().get_nodes_in_group(Global.GROUP_CAMERAS)
	length   = len(list)
	last_ind = length - 1
	var i = 0
	for node in list:
		if node is Camera && node.current:
			if ind == -1:
				ind = i
			else:
				node.current = false
		i += 1


func _input(event):
	if event is InputEventKey && event.pressed:
		if event.is_action_pressed("ui_camera"):
			list[ind].current = false
			if ind >= last_ind:
				ind = 0
			else:
				ind += 1
			list[ind].current = true
			
			print(list[ind])
