class_name ActionMachine extends Node


#onready var state: ActionState = get_node("/root/World/Debug/CameraFloat/ActionDebug")
onready var state: ActionState = get_node("/root/World/Player/ActionPlayer")


func _ready():
	#yield(owner, "ready")
	#print(state)
	
	state.action_machine = self
#	yield(owner, "ready")
#	for child in get_children():
#		child.action_machine = self
#	state.enter()


func _input(event):
	state.input(event)


func _unhandled_input(event):
	state.unhandled_input(event)


func _process(delta):
	state.process(delta)


func _physics_process(delta):
	state.physics_process(delta)
