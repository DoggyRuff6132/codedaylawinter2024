extends Area3D

@export var damage = 10
var speed = 10

func _physics_process(delta):
	position.z += speed * delta

func _on_area_entered(area):
	pass
