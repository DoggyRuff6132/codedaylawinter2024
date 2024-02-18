extends Node3D

@export var objects : Array[ObstacleWeight]
var totalWeight = 0
var timeBetweenSpawns = 2.0
var t_tbs

# Called when the node enters the scene tree for the first time.
func _ready():
	t_tbs = timeBetweenSpawns
	
	for i in objects:
		totalWeight += i.weight
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t_tbs -= delta
	
	if t_tbs < 0:
		var rng = RandomNumberGenerator.new()
		rng.randi_range(1,totalWeight)

func _getObjectWeight(weight):
	var currentWeight = 0
	
	for i in range(objects.size()):
		currentWeight += objects[i].weight
		if weight < currentWeight:
			return objects[i]
