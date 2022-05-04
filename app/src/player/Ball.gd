extends RigidBody


enum {PARKED, HOVERED, PAUSED}

export(float, 5, 100) var speed = 20
export(float) var radius = .6 setget set_radius

var player: Player
var direction := Vector3.ZERO
var velocity  := Vector3.ZERO
var status    := PARKED


func _ready():
	set_radius(radius)


func _integrate_forces(state):
	if status == HOVERED:
		if !direction.is_equal_approx(state.linear_velocity.normalized()):
			move(state.linear_velocity)
			state.transform.origin = player.plane.project(state.transform.origin)
			state.transform = state.transform.orthonormalized().scaled(scale)
		
		state.linear_velocity = velocity
		
#		var count = state.get_contact_count()
#		if count > 0:
#			for i in range(count):
#				prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#				state.linear_velocity *= state.get_contact_local_normal(i)


func set_radius(value: float) -> void:
	var mesh = $MeshInstance.mesh
	mesh.radius = value
	mesh.height = value * 2
	$CollisionShape.shape.radius = value
	$Area/CollisionShape.shape.radius = value + .2


func pause() -> void:
	if status != PARKED:
		if status == PAUSED:
			start(direction)
		else:
			stop()
			status = PAUSED


func reset() -> void:
	stop()
	status = PARKED


func start(dir: Vector3) -> void:
	move(dir)
	linear_velocity = velocity
	status = HOVERED


func move(dir: Vector3) -> void:
	direction = player.plane.project(dir).normalized()
	velocity  = direction * speed


func stop() -> void:
	set_linear_velocity(Vector3.ZERO)
	set_angular_velocity(Vector3.ZERO)
