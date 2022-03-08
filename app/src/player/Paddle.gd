extends StaticBody


var player: Spatial
var offset_y = 0.25

onready var ball = player.ball
onready var ball_position = $BallPosition


#const MOVE_SPEED = 100
#var _ball_dir
#var _up
#var _down
#onready var _screen_size_y = get_viewport_rect().size.y


func _ready():
	transform.origin.y = -offset_y
	ball_position.transform = Transform(ball_position.transform.basis, Vector3(0, offset_y + ball.radius + 0.001, 0))


#func _process(delta):
#	# Move up and down based on input.
#	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
#	position.y = clamp(position.y + input * MOVE_SPEED * delta, 16, _screen_size_y - 16)


#func _on_Area_area_entered(area):
#	if area.name == "Ball":
#		# Assign new direction.
#		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
