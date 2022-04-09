extends RigidBody


enum {PARKED, HOVERED, PAUSED}

export(float, 5, 100) var speed = 20
export(float) var radius = .6 setget set_radius

var velocity := Vector3.ZERO
var status   := PARKED


func _ready():
	set_radius(radius)
	#prints(linear_velocity, to_global(linear_velocity))


func _integrate_forces(state):
	if status == HOVERED:
		velocity = state.linear_velocity.normalized() * speed #* state.get_step())
		set_linear_velocity(velocity)
	
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
	return


func pause() -> void:
	if status != PARKED:
		if status == PAUSED:
			start(velocity)
		else:
			stop()
			status = PAUSED
	return


func reset() -> void:
	stop()
	status = PARKED
	return


func start(direction: Vector3) -> void:
	velocity = direction.normalized() * speed
	set_linear_velocity(velocity) #* get_physics_process_delta_time())
	status = HOVERED
	return


func stop() -> void:
	set_linear_velocity(Vector3.ZERO)
	return
