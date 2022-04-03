extends RigidBody


export(float, 5, 100) var speed = 20
export(float) var radius = .6 setget set_radius

var velocity  := Vector3.ZERO
var is_parked := true


func _ready():
	set_radius(radius)
	#prints(linear_velocity, to_global(linear_velocity))


func _integrate_forces(state):
	if !is_parked:
		if state.linear_velocity.length() != speed:
			velocity = state.linear_velocity.normalized() * speed
			set_linear_velocity(velocity) #* state.get_step())
			#set_linear_velocity(global_transform.basis.xform(state.linear_velocity.normalized() * speed)) #* state.get_step())
	
#	var count = state.get_contact_count()
#	if count > 0:
#		for i in range(count):
#			prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#			state.linear_velocity *= state.get_contact_local_normal(i)
#	else:
#		state.linear_velocity = state.linear_velocity


func set_radius(value: float) -> void:
	var mesh = $MeshInstance.mesh
	mesh.radius = value
	mesh.height = value * 2
	$CollisionShape.shape.radius = value
	$Area/CollisionShape.shape.radius = value + .2


func pause() -> void:
	if is_parked:
		start(velocity)
	else:
		stop()


func start(direction: Vector3) -> void:
	#if is_parked:
		velocity = direction.normalized() * speed
		set_linear_velocity(velocity) #* get_physics_process_delta_time())
		is_parked = false


func stop() -> void:
	#if !is_parked:
		set_linear_velocity(Vector3.ZERO)
		is_parked = true


#func reset() -> void:
#	direction = Vector3.UP
#	position = _initial_pos
#	_speed = DEFAULT_SPEED
