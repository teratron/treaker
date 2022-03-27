extends Spatial


#func _init():
#	pass


func _ready():
	#prints("world", $Player.transform.basis.y, $Player.to_global(transform.basis.y))
	prints("world", $Player.transform.origin, $Player.to_global(transform.origin))
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	print(get_viewport().print_tree())


#func _physics_process(_delta):
#	#print($Ball.global_transform.origin)
#	pass


#func _input(event):
#	if event.is_action_pressed("toggle_mouse_capture"):
#		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
#			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#		else:
#			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
