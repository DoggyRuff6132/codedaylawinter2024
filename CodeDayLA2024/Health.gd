extends Node3D

@export var maxHealth : int = 100
var currentHealth : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth = maxHealth

func TakeDamage(damage : int):
	currentHealth -= damage
	if currentHealth < 0:
		Die()

func Die():
	get_parent().queue_free()
