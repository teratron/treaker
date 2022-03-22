extends MeshInstance


#func _init():
#	visible = false


func _ready():
	mesh.flip_faces = true
	create_trimesh_collision()
