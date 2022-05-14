class_name ActionMachine extends StateMachine

onready var action_player := get_node("/root/World/Player/ActionPlayer") as State
onready var action_debug  := get_node("/root/World/Debug/CameraFloat/ActionDebug") as State

func _ready():
	yield(owner, "ready")
	state = get_node("/root/World/Player/ActionPlayer") as State
	#state = get_node("/root/World/Debug/CameraFloat/ActionDebug") as State
	state.state_machine = self


func _unhandled_input(event):
	if (event is InputEventKey || event is InputEventMouseButton) && event.pressed:
		if event.is_action_pressed("toggle_camera"):
			print("+++")
			pass
