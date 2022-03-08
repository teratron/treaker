extends RigidBody


var player: Spatial
var radius: float
var speed = 600


#var direction = Vector3.UP
#var position = Transform()
#var velocity = Vector3(0,10,0)
#
##onready var _initial_pos = position


func _enter_tree():
	radius = $MeshInstance.mesh.radius


func _ready():
	#linear_velocity.y = speed
	
	#add_force(Vector3(0,10,0), Vector3(0,10,0))
	#apply_impulse(Vector3(0,1,0), Vector3(0,10,0))
	#print(player.get_node("Rotor/Paddle/BallPosition").transform.origin)
	#print($MeshInstance.mesh.radius)
	pass


#func _physics_process(_delta):
#	if Input.is_action_pressed("use_shot"):
#		linear_velocity.y = speed


func _input(event):
	if (event is InputEventKey || InputEventMouseButton) && event.is_action_pressed("use_shot"):
		linear_velocity.y = speed


func _integrate_forces(state):
#	var count = state.get_contact_count()
#	if count > 0:
#		for i in range(count):
#			prints(state.get_contact_local_normal(i),  state.get_contact_local_position(i))
#			state.linear_velocity *= state.get_contact_local_normal(i)
#	else:
#		state.linear_velocity = state.linear_velocity
	
	var delta = state.get_step()
	state.linear_velocity = state.linear_velocity.normalized() * speed * delta


#func reset():
#	direction = Vector3.UP
#	position = _initial_pos
#	_speed = DEFAULT_SPEED
