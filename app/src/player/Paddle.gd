extends StaticBody


onready var ball_position := $BallPosition
#
#func set_ball_position(radius: float) -> void:
#	var err_rate = radius * 2 * .001
#	ball_position.transform.origin = Vector3(0, $MeshInstance.mesh.get_aabb().size.y * .5 + radius + err_rate, 0)

var ball: Vector3 setget set_ball_position, get_ball_position


func set_ball_position(position: Vector3) -> void:
	ball.y = $MeshInstance.mesh.get_aabb().size.y * .5 + position.y * 1.002
	$BallPosition.transform.origin = ball
	#ball_position.y += $MeshInstance.mesh.get_aabb().size.y * .5
	#print(ball_position)


func get_ball_position() -> Vector3:
	return ball


func _on_Area_area_entered(_area):
	#prints(area, area.get_parent(), area.owner)
	pass


func _on_Area_body_entered(_body):
	#print(body)
	pass
