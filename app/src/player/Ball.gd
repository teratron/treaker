extends RigidBody


#const DEFAULT_SPEED = 10
#
#var _speed = DEFAULT_SPEED
#var direction = Vector3.UP
#var position = Transform()
#
##onready var _initial_pos = position
#
#
#func _ready():
#	pass


func _physics_process(_delta):
	#transform = transform.orthonormalized()
	print(transform.origin)
	
#	_speed += delta * 2
#	transform.origin = Vector3(-_speed, -_speed, 0) * direction
	
	#prints(Vector3(-_speed, -_speed, 0), transform.origin)
	#position += _speed * delta * direction
	#transform = position.translated(Vector3(0, 1, 0))
	pass


#func reset():
#	direction = Vector3.UP
#	position = _initial_pos
#	_speed = DEFAULT_SPEED
