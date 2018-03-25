extends KinematicBody2D

onready var s_music = get_node("SHallow music")
onready var d_music = get_node("Deep music")

onready var s_playing = false

var velocity = Vector2()

var maxSpeed = Vector2(3, 100)
var accel = Vector2(0, 20)

var controlsInverted = false

func _ready():
	set_physics_process(true)
	
	
func _physics_process(delta):
	
	#music
	
	if get_position().y <= 1980 and s_playing == false:
		s_music.play()
		s_playing = true
		d_music.stop()

	
	if get_position().y >= 2100 and s_playing == true:
		s_music.stop()
		s_playing = false
		d_music.play()
		
	
	#Claw movement
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		velocity.y += accel.y
		if velocity.y > maxSpeed.y:
			velocity.y = maxSpeed.y
	else:
		velocity.y -= accel.y
		if velocity.y < -maxSpeed.y * 1.2:
			velocity.y = -maxSpeed.y * 1.2
	
	if !controlsInverted:
		velocity.x = get_viewport().get_mouse_position().x - self.position.x
	else:
		velocity.x = self.position.x - get_viewport().get_mouse_position().x
		
	move_and_collide(velocity * delta)
	
func _on_Area2D_body_enter(body):
    print(str('Body entered: ', body.get_name()))
	
