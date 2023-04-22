extends CharacterBody2D

# CharacterBody2D class has certain properties that control the character
#   velocity -- the velocity of the characters movement, starts at (x=0,y=0)

var speed = 300.0

# called every frame
func _physics_process(delta):	
	# reset velocity to 0 (stop acceleration)
	velocity.y=0
	# get user input
	# keep in mind coord system has 0,0 at top left, so -'ve velocity moves up & +'ve moves down
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y += speed
	# moves the body based on velocity
	move_and_slide()

# called when the scene is ready
func _ready():
	pass
