extends Camera3D
func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	position += basis * xy(dir) * delta
	var rot = Input.get_axis("rotate_right", "rotate_left")
	rotate_z(rot * delta * 2 * PI)



func xy(v: Vector2) -> Vector3:
	return Vector3(v.x, v.y, 0.0)
