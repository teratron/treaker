extends RigidBody


const DEFAULT_SPEED = 12
#
var _speed = DEFAULT_SPEED
#var direction = Vector3.UP
#var position = Transform()
#
##onready var _initial_pos = position


func _ready():
	#add_force(Vector3(0,10,0), Vector3(0,10,0))
	#apply_impulse(Vector3(0,1,0), Vector3(0,10,0))
	linear_velocity = Vector3(0,_speed,0)
	pass


func _physics_process(_delta):
	#transform = transform.orthonormalized()
	#print(global_transform.origin)
	
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

var velocity = Vector3(0,10,0)

func _integrate_forces(state):
	#prints(state.angular_velocity)
	#prints(get_colliding_bodies())
	#state.linear_velocity = Vector3(0,10,0)

#	var count = state.get_contact_count()
#	if count > 0:
#		for i in range(count):
#			prints(state.get_contact_local_normal(i),  state.get_contact_local_position(i))
#			state.linear_velocity *= state.get_contact_local_normal(i)
#	else:
#		state.linear_velocity = state.linear_velocity

	state.linear_velocity = state.linear_velocity.normalized() * _speed

	pass
