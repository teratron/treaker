extends Control


const MARGIN = 4

export var sticky := true

onready var camera := get_viewport().get_camera()
onready var parent := get_parent()
onready var marker := $Marker


func _ready():
	if !parent is Spatial:
		push_error("The waypoint's parent node must inherit from Spatial.")


func _process(_delta):
	if !camera.current:
		camera = get_viewport().get_camera()
	
	var parent_translation   = parent.global_transform.origin
	var camera_transform     = camera.global_transform
	var camera_translation   = camera_transform.origin
	var unprojected_position = camera.unproject_position(parent_translation)
	var is_behind = camera_transform.basis.z.dot(parent_translation - camera_translation) > 0
	
	if !sticky:
		rect_position = unprojected_position
		visible = !is_behind
		return
	
	var distance = camera_translation.distance_to(parent_translation)
	modulate.a = clamp(range_lerp(distance, 0, 2, 0, 1), 0, 1)
	
	var viewport_base_size = (
			get_viewport().get_size_override() if get_viewport().get_size_override() > Vector2(0, 0)
			else get_viewport().size
		)
	
	# We need to handle the axes differently.
	# For the screen's X axis, the projected position is useful to us,
	# but we need to force it to the side if it's also behind.
	if is_behind:
		if unprojected_position.x < viewport_base_size.x / 2:
			unprojected_position.x = viewport_base_size.x - MARGIN
		else:
			unprojected_position.x = MARGIN
	
	# For the screen's Y axis, the projected position is NOT useful to us
	# because we don't want to indicate to the user that they need to look
	# up or down to see something behind them. Instead, here we approximate
	# the correct position using difference of the X axis Euler angles
	# (up/down rotation) and the ratio of that with the camera's FOV.
	# This will be slightly off from the theoretical "ideal" position.
	if is_behind || unprojected_position.x < MARGIN || unprojected_position.x > viewport_base_size.x - MARGIN:
		var look = camera_transform.looking_at(parent_translation, Vector3.UP)
		var diff = angle_diff(look.basis.get_euler().x, camera_transform.basis.get_euler().x)
		unprojected_position.y = viewport_base_size.y * (.5 + diff / deg2rad(camera.fov))
	
	rect_position = Vector2(
			clamp(unprojected_position.x, MARGIN, viewport_base_size.x - MARGIN),
			clamp(unprojected_position.y, MARGIN, viewport_base_size.y - MARGIN)
		)
	
	#label.visible = true
	rect_rotation = 0
	# Used to display a diagonal arrow when the waypoint is displayed in
	# one of the screen corners.
	var overflow = 0
	
	if rect_position.x <= MARGIN:
		# Left overflow.
		overflow = -45
		#label.visible = false
		rect_rotation = 90
	elif rect_position.x >= viewport_base_size.x - MARGIN:
		# Right overflow.
		overflow = 45
		#label.visible = false
		rect_rotation = 270
	
	if rect_position.y <= MARGIN:
		# Top overflow.
		#label.visible = false
		rect_rotation = 180 + overflow
	elif rect_position.y >= viewport_base_size.y - MARGIN:
		# Bottom overflow.
		#label.visible = false
		rect_rotation = -overflow


static func angle_diff(from, to):
	var diff = fmod(to - from, TAU)
	return fmod(2.0 * diff, TAU) - diff
