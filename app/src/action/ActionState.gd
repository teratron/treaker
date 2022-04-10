class_name ActionState extends Node


var action_machine = null
var action_parent  = null
var action_owner   = null


func _ready():
	yield(owner, "ready")
	action_parent = get_parent()
	action_owner  = owner
	assert(action_parent != null && action_owner != null)


func input(_event: InputEvent) -> void:
	pass


func unhandled_input(_event: InputEvent) -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass
