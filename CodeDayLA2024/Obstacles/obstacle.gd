extends StaticBody3D

@export var damage = 10
var speed = 10

func _physics_process(delta):
	position.z += speed * delta
	if position.z > 2:
		queue_free()

func _on_area_entered(area):
	pass
