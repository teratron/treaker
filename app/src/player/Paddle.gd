extends StaticBody


onready var ball_position := $BallPosition


func set_ball_position(radius: float) -> void:
	var err_rate = .001 * radius * 2
	ball_position.transform.origin = Vector3(0, $MeshInstance.mesh.get_aabb().size.y * .5 + radius + err_rate, 0)


func _on_Area_area_entered(_area):
	#prints(area, area.get_parent(), area.owner)
	pass


func _on_Area_body_entered(_body):
	#print(body)
	pass
