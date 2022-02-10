extends Spatial


var actionMap    = load("res://src/action/ActionMap.gd").new()
var cameraSwitch = load("res://src/debug/CameraSwitch.gd").new()


func _init():
	actionMap.addAction("move_forward",  [KEY_W, KEY_UP])
	actionMap.addAction("move_backword", [KEY_S, KEY_DOWN])
	actionMap.addAction("move_left",     [KEY_A, KEY_LEFT])
	actionMap.addAction("move_right",    [KEY_D, KEY_RIGHT])
	actionMap.addAction("move_up",       [KEY_SPACE])
	actionMap.addAction("move_down",     [KEY_SHIFT])
	actionMap.addAction("ui_camera",     [KEY_C])
	pass


func _ready():
	print(get_viewport().get_children()[1].get_children())
	print(get_viewport().get_tree().to_string())
	add_child(cameraSwitch)


#func _process(_delta):
#	if Input.is_action_just_pressed("ui_camera"):
#		if cam_world.current:
#			cam_world.current = false
#			cam_player.current = true
#		else:
#			cam_world.current = true
#			cam_player.current = false


#func _input(event):
#	if event is InputEventKey && event.pressed:
#		if event.is_action_pressed("ui_camera"):
#			camera.active.current = false
#			camera.id = id + 1
#			camera.list[camera.id].current = true
#
#			print("T was pressed")
