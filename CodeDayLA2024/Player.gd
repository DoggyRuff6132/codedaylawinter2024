extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var lifecount=3

func _ready():
	_updateLifeCounter()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + 7
		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Jump","Slide")
	var direction = (transform.basis * Vector3(input_dir.x,0,0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if lifecount == 0:
		gameover()
	elif position.z > 2:
		respawn()

	move_and_slide()
	
func gameover():
	$GameOverLabel.set_text("Game Over")
	
	$Health.Die()
	position.y= -1
func respawn():
	print("resapwning!")
	position.z = -1
	lifecount-=1
	_updateLifeCounter()
	
func _updateLifeCounter():
	$LifeCounter.set_text("Lives: " + str(lifecount))
