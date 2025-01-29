extends CharacterBody3D
class_name Player
@onready var sprite_3d: Sprite3D = $Sprite3D
@onready var camera_3d: PlayerCamera = $Camera3D


func _physics_process(delta: float) -> void:
	var dir = camera_3d.basis * xy(Input.get_vector("left", "right", "down", "up"))
	velocity = dir  * 2.0
	var subdelt := delta / 5
	
	for i in 5:
		var col = move_and_collide(velocity * subdelt)
		if col:
			velocity = velocity.slide(col.get_normal())

func xy(v: Vector2) -> Vector3:
	return Vector3(v.x, v.y, 0.)
