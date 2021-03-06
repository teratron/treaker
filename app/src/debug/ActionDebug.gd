extends State


var camera: Camera


func _ready():
	yield(owner, "ready")
	camera = state_parent as Camera
	assert(camera != null)


func unhandled_input(event):
	camera.unhandled_input(event)


func process(delta):
	camera.process(delta)


#func input(event):
#	if event is InputEventKey and event.pressed:
#		if event.scancode == KEY_T:
#			print("Debug: T was pressed")
