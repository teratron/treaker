extends RigidBody


#var player: Spatial
var speed: float = 600
var direction := Vector3.UP

onready var radius = $MeshInstance.mesh.radius


func _integrate_forces(state):
	var delta = state.get_step()
	state.linear_velocity = state.linear_velocity.normalized() * speed * delta
#	var count = state.get_contact_count()
#	if count > 0:
#		for i in range(count):
#			prints(state.get_contact_local_normal(i), state.get_contact_local_position(i))
#			state.linear_velocity *= state.get_contact_local_normal(i)
#	else:
#		state.linear_velocity = state.linear_velocity


func start() -> bool:
	linear_velocity.y = speed
	return true
#	player.is_ball_state = true


#func reset() -> void:
#	direction = Vector3.UP
#	position = _initial_pos
#	_speed = DEFAULT_SPEED
