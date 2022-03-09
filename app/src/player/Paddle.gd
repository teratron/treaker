extends StaticBody


var player: Spatial
var offset_y = 0.25

onready var ball = player.ball
onready var ball_position = $BallPosition


func _ready():
	transform.origin.y = -offset_y
	ball_position.transform = Transform(ball_position.transform.basis, Vector3(0, offset_y + ball.radius + 0.001, 0))


#func _on_Area_area_entered(area):
#	if area.name == "Ball":
#		# Assign new direction.
#		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
