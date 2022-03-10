extends StaticBody


var player: Spatial

onready var ball = player.ball
onready var ball_position = $BallPosition
onready var mesh_instance = $MeshInstance


func _ready():
	var height = mesh_instance.mesh.get_aabb().size.y
	ball_position.transform = Transform(ball_position.transform.basis, Vector3(0, height * 0.5 + ball.radius + 0.001, 0))


#func _on_Area_area_entered(area):
#	if area.name == "Ball":
#		# Assign new direction.
#		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
