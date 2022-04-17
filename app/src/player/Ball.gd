extends RigidBody


enum {PARKED, HOVERED, PAUSED}

export(float, 5, 100) var speed = 20
export(float) var radius = .6 setget set_radius

var player: Player
var velocity := Vector3.ZERO
var status   := PARKED


func _ready():
	set_radius(radius)
	#yield(owner, "ready")
	#prints(player, player.transform.basis.xform(Vector3(1, 0, 1)))
	#set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_Z, true)


func _integrate_forces(state):
	if status == HOVERED:
		#prints(state.center_of_mass, state.total_gravity)
		#prints(velocity)
		
		#velocity = state.linear_velocity.normalized() * speed #* state.get_step())
		#velocity.z = 0
		#prints(velocity, state.get_velocity_at_local_position(velocity))
		#velocity = player.global_transform.basis.xform(velocity)
		#prints(velocity, player.transform.basis.xform(velocity))
		#set_linear_velocity(velocity)
		#set_linear_velocity(player.transform.basis.xform(velocity))
		
		var count = state.get_contact_count()
		if count > 0:
			velocity = state.linear_velocity.normalized() * speed
			velocity.z = 0
			velocity = player.transform.basis.xform(velocity)
#			for i in range(count):
#				prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#				state.linear_velocity *= state.get_contact_local_normal(i)
		#else:
			#set_linear_velocity(velocity)
		
		set_linear_velocity(velocity)


func set_radius(value: float) -> void:
	var mesh = $MeshInstance.mesh
	mesh.radius = value
	mesh.height = value * 2
	$CollisionShape.shape.radius = value
	$Area/CollisionShape.shape.radius = value + .2


func pause() -> void:
	if status != PARKED:
		if status == PAUSED:
			start(velocity)
		else:
			stop()
			status = PAUSED


func reset() -> void:
	stop()
	status = PARKED


func start(direction: Vector3) -> void:
	velocity = direction.normalized() * speed
	#velocity.z = 0
	#set_linear_velocity(player.transform.basis.xform(velocity)) #* get_physics_process_delta_time())
	set_linear_velocity(velocity) #* get_physics_process_delta_time())
	status = HOVERED


func stop() -> void:
	set_linear_velocity(Vector3.ZERO)
	set_angular_velocity(Vector3.ZERO)
