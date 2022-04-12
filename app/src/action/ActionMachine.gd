class_name ActionMachine extends StateMachine


func _ready():
	yield(owner, "ready")
	state = get_node("/root/World/Player/ActionPlayer") as State
	#state = get_node("/root/World/Debug/CameraFloat/ActionDebug") as State
	state.state_machine = self
