extends StaticBody


onready var ball_position := $BallPosition


func set_ball_position(radius: float) -> void:
	ball_position.transform.origin = Vector3(0, $MeshInstance.mesh.get_aabb().size.y * 0.5 + radius + 0.001, 0)


func _on_Area_area_entered(area):
	prints(area, area.get_parent(), area.owner)


func _on_Area_body_entered(body):
	print(body)
