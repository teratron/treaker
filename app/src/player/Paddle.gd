extends StaticBody


#onready var _ball_position := $BallPosition

#var ball: Vector3 setget set_ball_position, get_ball_position
var ball_position: Transform setget, get_ball_position

#func set_ball_position(position: Vector3) -> void:
#	ball.y = $MeshInstance.mesh.get_aabb().size.y * .5 + position.y * 1.002
#	$BallPosition.transform.origin = ball
#	#ball_position.y += $MeshInstance.mesh.get_aabb().size.y * .5
#	#print(ball_position)


#func _ready():
#	yield(owner, "ready")


func set_ball_position(radius: float) -> void:
	$BallPosition.transform.origin.y = $MeshInstance.mesh.get_aabb().size.y * .5 + radius * 1.002


func get_ball_position() -> Transform:
	#print(get_parent())
	#return $BallPosition.transform
	var pos := $BallPosition
	#var z = Vector3.ZERO #pos.transform.origin
	#prints(transform.xform(z), owner.get_child(0).transform.xform(z), owner.transform.xform(z), owner.get_child(0))
	return Transform(pos.transform.basis, transform.xform(pos.transform.origin))


func _on_Area_area_entered(_area):
	#prints(area, area.get_parent(), area.owner)
	pass


func _on_Area_body_entered(_body):
	#print(body)
	pass
