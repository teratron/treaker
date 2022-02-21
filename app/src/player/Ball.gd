extends RigidBody


const DEFAULT_SPEED = 100

var _speed = DEFAULT_SPEED
var direction = Vector3.UP

onready var _initial_pos = position


func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction


func reset():
	direction = Vector3.UP
	position = _initial_pos
	_speed = DEFAULT_SPEED
