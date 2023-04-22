extends CharacterBody2D

# CharacterBody2D class has certain properties that control the character
#   velocity -- the velocity of the characters movement, starts at (x=0,y=0)

var speed = 600

# called when the scene is ready
func _ready():
	randomize()	
	# randomly move ball left or right
	velocity.x = [-1,1][randi() % 2]
	# move ball at a random starting angle
	velocity.y = [-0.4,0.4][randi() % 2]
	
# called every frame to move character
# delta is the amount of time that has passed since the last frame
func _physics_process(delta):
	# move_and_collide returns a collision object when it collides with another object
	var collision = move_and_collide(velocity * speed * delta)
	# if there is a collision detected then bounce the ball off the collided object
	if collision:
		# play hit sound
		$CollisionSound.play()
		# bounce ball off object
		velocity = velocity.bounce(collision.get_normal())

func stop_ball():
	speed = 0

func start_ball():
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.5,0.5][randi() % 2]
	speed = 600
