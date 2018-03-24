extends KinematicBody2D

const dx = 75
var velocity = Vector2()

var facingRight = true

func _ready():
	var random = randomize()
	random = randi()%2
	print(random)
	if random == 0:
		facingRight = true
	else:
		facingRight = false
	set_physics_process(true)

func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		facingRight = !facingRight
	
	# set velocity to move in correct direction
	if facingRight:
		velocity.x = dx
	else:
		velocity.x = -dx
			
	move_and_collide(velocity * delta)