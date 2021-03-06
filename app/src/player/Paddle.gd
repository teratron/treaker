extends StaticBody


var ball_position: Vector3 setget, get_ball_position

onready var ball := $BallPosition


func set_ball_position(radius: float) -> void:
	ball.transform.origin.y = ($CSGCylinder.radius - $CSGCylinder/CSGCylinder.radius) * .5 + radius


func get_ball_position() -> Vector3:
	return transform.xform(ball.transform.origin)


func _on_Area_area_entered(_area):
	#prints(area, area.get_parent(), area.owner)
	pass


func _on_Area_body_entered(_body):
	#print(body)
	pass
