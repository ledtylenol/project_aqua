extends Camera3D
class_name PlayerCamera
@export var z_dist := position.z
@export var player: Player
@export var sprite: Sprite3D
func _physics_process(delta: float) -> void:
	var rot := Input.get_axis("rotate_left", "rotate_right")
	rotate_z(-rot * delta * PI)
	if Input.is_action_just_pressed("reset"):
		rotation.z = 0
		sprite.rotation.z = rotation.z
		player.reset_physics_interpolation()
	sprite.rotation.z = rotation.z
func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_pressed():
		if event.is_action("zoom_out"):
			position.z *= 1.1
		if event.is_action("zoom_in"):
			position.z *= 0.9
