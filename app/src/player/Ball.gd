extends RigidBody


export(float, 0, 2000) var speed = 600
export(float) var radius = .6 setget set_radius


func _ready():
	set_radius(radius)


func _integrate_forces(state):
	#print(transform.origin.z)
	var step = state.get_step()
	#prints(state.linear_velocity, state.linear_velocity.length(), linear_velocity.length())
	#state.linear_velocity = state.linear_velocity.normalized() * speed * step
	state.set_linear_velocity(state.linear_velocity.normalized() * speed * step)
#	var count = state.get_contact_count()
#	if count > 0:
#		for i in range(count):
#			prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#			state.linear_velocity *= state.get_contact_local_normal(i)
#	else:
#		state.linear_velocity = state.linear_velocity


func set_radius(param):
	var mesh = $MeshInstance.mesh
	mesh.radius = param
	mesh.height = param * 2
	$CollisionShape.shape.radius = param
	$Area/CollisionShape.shape.radius = param + .2


func start(direction: Vector3) -> void:
	linear_velocity = direction.normalized() * speed


#func reset() -> void:
#	direction = Vector3.UP
#	position = _initial_pos
#	_speed = DEFAULT_SPEED
