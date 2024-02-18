extends Node3D
class_name Health

@export var maxHealth : int = 100
var currentHealth : int = 100
var dead = false

@onready var dieSound = $dieSound
# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth = maxHealth

func _process(delta):
	if currentHealth < 0:
		Die()

func TakeDamage(damage : int):
	currentHealth -= damage
	if currentHealth < 0:
		Die()

func Die():
	if !dead:
		print("died")
		dieSound.play()
		dead = true
