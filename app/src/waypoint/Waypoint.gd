extends Control


const MARGIN = 4

#export var sticky := true

onready var camera := get_viewport().get_camera()
onready var parent := get_parent()
#onready var marker := $Marker


func _ready():
	if !parent is Spatial:
		push_error("The waypoint's parent node must inherit from Spatial.")


func _process(_delta):
	var viewport := get_viewport()
	
	if !camera.current:
		camera = viewport.get_camera()
	
	var parent_translation   = parent.global_transform.origin
	var camera_transform     = camera.global_transform
	var camera_translation   = camera_transform.origin
	var unprojected_position = camera.unproject_position(parent_translation)
	#var is_behind = camera_transform.basis.z.dot(parent_translation - camera_translation) > 0
	var is_behind = camera.is_position_behind(parent_translation)
	#prints(is_behind, camera.is_position_behind(parent_translation))
	
#	if !sticky:
#		rect_position = unprojected_position
#		visible = !is_behind
#		return
	
	var viewport_size = viewport.get_size_override()
	viewport_size = (
			viewport_size if viewport_size > Vector2(0, 0)
			else viewport.size
		)
	
	if is_behind:
		if unprojected_position.x < viewport_size.x / 2:
			unprojected_position.x = viewport_size.x - MARGIN
		else:
			unprojected_position.x = MARGIN
	
	if is_behind || unprojected_position.x < MARGIN || unprojected_position.x > viewport_size.x - MARGIN:
		var look = camera_transform.looking_at(parent_translation, Vector3.UP)
		var diff = angle_diff(look.basis.get_euler().x, camera_transform.basis.get_euler().x)
		unprojected_position.y = viewport_size.y * (.5 + diff / deg2rad(camera.fov))
	
	rect_position = Vector2(
			clamp(unprojected_position.x, MARGIN, viewport_size.x - MARGIN),
			clamp(unprojected_position.y, MARGIN, viewport_size.y - MARGIN)
		)
	
	var overflow := 0.0
	var rotation := 0.0
	
	if rect_position.x <= MARGIN:
		overflow = -45
		rotation = 90
	elif rect_position.x >= viewport_size.x - MARGIN:
		overflow = 45
		rotation = 270
	
	if rect_position.y <= MARGIN:
		rotation = 180 + overflow
	elif rect_position.y >= viewport_size.y - MARGIN:
		rotation = -overflow
	
	rect_rotation = rotation
	
	
#	prints(camera.is_position_behind(parent_translation))
#	visible = not camera.is_position_behind(parent_translation)
#	rect_position = camera.unproject_position(parent_translation)

	
	
#	if unprojected_position > Vector2(0, 0) && unprojected_position < get_viewport().size:
#		visible = false
#	else:
#		visible = true
	
#	if unprojected_position.x >= 0 && unprojected_position.x <= get_viewport().size.x && \
#		unprojected_position.y >= 0 && unprojected_position.y <= get_viewport().size.y:
#		visible = false
#	else:
#		visible = true


static func angle_diff(from, to):
	var diff = fmod(to - from, TAU)
	return fmod(2.0 * diff, TAU) - diff
