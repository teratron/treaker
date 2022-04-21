extends RigidBody


enum {PARKED, HOVERED, PAUSED}

export(float, 5, 100) var speed = 20
export(float) var radius = .6 setget set_radius

var player: Player
var velocity := Vector3.ZERO
var status   := PARKED


func _ready():
	set_radius(radius)
	#print(Vector3(7,3,1).project(Vector3(2,1,0)))
	#yield(owner, "ready")
	#prints(player, player.transform.basis.xform(Vector3(1, 0, 1)))
	#set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_Z, true)


func _integrate_forces(state):
	if status == HOVERED:
		
		if !velocity.normalized().is_equal_approx(state.linear_velocity.normalized()):
			velocity = state.linear_velocity.normalized() * speed #* state.get_step())
			#move(state.linear_velocity)
			
		#else:
		#prints(velocity, "X:", player.transform.basis.x, velocity.project(player.transform.basis.x), "Y:", player.transform.basis.y, velocity.project(player.transform.basis.y))
		prints(velocity, velocity.project(Vector3(1,1,0)))
		set_linear_velocity(velocity)
#			velocity = state.linear_velocity.normalized() * speed #* state.get_step())
#			velocity.z = 0
#			velocity = player.transform.basis.xform(velocity)
#		set_linear_velocity(velocity)
		#	prints(velocity.normalized(), state.linear_velocity.normalized())
		
		#velocity = state.linear_velocity.normalized() * speed #* state.get_step())
		#velocity.z = 0
		#prints(velocity, state.get_velocity_at_local_position(velocity))
		#velocity = player.global_transform.basis.xform(velocity)
		#prints(velocity, player.transform.basis.xform(velocity))
		#set_linear_velocity(velocity)
		#set_linear_velocity(player.transform.basis.xform(velocity))
		
#		var count = state.get_contact_count()
#		if count > 0:
#			for i in range(count):
#				prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#				state.linear_velocity *= state.get_contact_local_normal(i)
#		else:
#			set_linear_velocity(velocity)


#func _physics_process(delta):
#	if status == HOVERED:
#		prints(velocity.normalized(), linear_velocity, player.transform.basis)
#		#print(deg2rad(30))


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
	#move(direction)
	velocity = direction.normalized() * speed #* get_physics_process_delta_time())
	set_linear_velocity(velocity)
	status = HOVERED


func move(direction: Vector3) -> void:
	#if !direction.is_normalized():
	velocity = direction.normalized() * speed #* get_physics_process_delta_time())
	#velocity.z = 0
	#velocity = player.transform.basis.xform(velocity)
	set_linear_velocity(velocity)


func stop() -> void:
	set_linear_velocity(Vector3.ZERO)
	set_angular_velocity(Vector3.ZERO)
