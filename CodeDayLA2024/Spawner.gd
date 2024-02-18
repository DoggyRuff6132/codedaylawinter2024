extends Node3D

@export var objects : Array[ObstacleWeight]
var totalWeight = 0
@export var timeBetweenSpawns = 1.0
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
		
		var obj = _getObjectWeight(rng.randi_range(1,totalWeight)).instantiate()
		print(obj)
		
		add_child(obj)
		
		obj.position = Vector3(rng.randf_range(-5,5),1,-25)
		
		t_tbs = timeBetweenSpawns
		

func _getObjectWeight(weight):
	var currentWeight = 0
	
	for i in objects:
		currentWeight += i.weight
		if weight < currentWeight:
			return i.scene
	
	return objects[0].scene
