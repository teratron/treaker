extends ActionState


func _ready():
	yield(owner, "ready")


#func input(event):
#	if event is InputEventKey and event.pressed:
#		if event.scancode == KEY_T:
#			print("Debug: T was pressed")
