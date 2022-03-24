extends RigidBody


export(float, 5, 100) var velocity = 20
export(float) var radius = .6 setget set_radius

var is_parked := true


func _ready():
	set_radius(radius)
	#prints(linear_velocity, to_global(linear_velocity))


func _integrate_forces(state):
	if !is_parked:
		var length = state.linear_velocity.length()
		if length < velocity || length > velocity:
			#prints(state.linear_velocity, length)
			#prints(state.linear_velocity.normalized() * velocity * step)
			set_linear_velocity(state.linear_velocity.normalized() * velocity * state.get_step())
			#prints(state.linear_velocity, to_global(state.linear_velocity))
			#prints(state.linear_velocity.length())
		
		
	
#	var count = state.get_contact_count()
#	if count > 0:
#		for i in range(count):
#			prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#			state.linear_velocity *= state.get_contact_local_normal(i)
#	else:
#		state.linear_velocity = state.linear_velocity


func set_radius(param) -> void:
	var mesh = $MeshInstance.mesh
	mesh.radius = param
	mesh.height = param * 2
	$CollisionShape.shape.radius = param
	$Area/CollisionShape.shape.radius = param + .2


func start(direction: Vector3) -> void:
	if is_parked:
		set_linear_velocity(direction.normalized() * velocity * get_physics_process_delta_time())
		is_parked = false


#func reset() -> void:
#	direction = Vector3.UP
#	position = _initial_pos
#	_speed = DEFAULT_SPEED
