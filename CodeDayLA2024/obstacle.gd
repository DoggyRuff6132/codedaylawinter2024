extends Area3D

@export var damage = 10

func _on_area_entered(area):
	if area.collision_layer == 3:
		area.TakeDamage(damage)
