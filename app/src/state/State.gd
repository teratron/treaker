class_name State extends Node


var state_machine = null
var state_parent  = null
var state_owner   = null


func _ready():
	yield(owner, "ready")
	state_parent = get_parent()
	state_owner  = owner
	assert(state_parent != null && state_owner != null)


func input(_event: InputEvent) -> void:
	pass


func unhandled_input(_event: InputEvent) -> void:
	pass


func unhandled_key_input(_event: InputEventKey) -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


# Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	pass


# Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass
