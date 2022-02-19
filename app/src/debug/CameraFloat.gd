extends Camera


const MOUSE_SENSITIVITY = 0.002
const MOVE_SPEED = 0.8

var rotate   = Vector3()
var velocity = Vector3()


func _input(event):
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# Horizontal mouse look.
		rotate.y -= event.relative.x * MOUSE_SENSITIVITY
		# Vertical mouse look.
		rotate.x = clamp(rotate.x - event.relative.y * MOUSE_SENSITIVITY, -1.57, 1.57)
		transform.basis = Basis(rotate)


func _process(delta):
	var motion = Vector3(
		Input.get_action_strength("move_right")    - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_up")       - Input.get_action_strength("move_down"),
		Input.get_action_strength("move_backword") - Input.get_action_strength("move_forward")
	)
	if motion != Vector3.ZERO:
		velocity += MOVE_SPEED * delta * transform.basis.xform(motion.normalized())
		velocity *= 0.85
		translation += velocity
