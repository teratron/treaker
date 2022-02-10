extends Spatial


const MOUSE_SENSITIVITY = 0.002
const MOVE_SPEED = 0.6

var action   = load("res://src/action/ActionMap.gd").new()
var rotate   = Vector3()
var velocity = Vector3()


func _init():
	action.addAction("move_left",   [KEY_A, KEY_LEFT])
	action.addAction("move_right",  [KEY_D, KEY_RIGHT])
	action.addAction("use_shot",    [KEY_SPACE])
	action.addAction("use_ability", [KEY_SHIFT])
	pass


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	# Mouse look (only if the mouse is captured).
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# Horizontal mouse look.
		rotate.y -= event.relative.x * MOUSE_SENSITIVITY
		# Vertical mouse look.
		rotate.x = clamp(rotate.x - event.relative.y * MOUSE_SENSITIVITY, -1.57, 1.57)
		transform.basis = Basis(rotate)
	
	if event.is_action_pressed("toggle_mouse_capture"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	var motion = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, 0)
	
	# Normalize motion to prevent diagonal movement from being
	# `sqrt(2)` times faster than straight movement.
	motion = motion.normalized()
	
	velocity += MOVE_SPEED * delta * transform.basis.xform(motion)
	velocity *= 0.85
	translation += velocity
