extends Obstacle
class_name MovingObstacle

var maxSideDisplacement = 2
var left = true
var dispSpeed = 10
var maxTime = 1
var t_max = 0

var onWall = false

var startPos

func _ready():
	startPos = position.x

func _physics_process(delta):
	position.z += speed * delta
	t_max -= delta
	
	if left:
		position.x -= dispSpeed * delta
	else:
		position.x += dispSpeed * delta
		
	if abs(startPos - position.x) > 3 or t_max < 0:
		left = !left
		t_max = maxTime
	
	if position.z > 2:
		queue_free()

