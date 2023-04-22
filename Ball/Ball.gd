extends CharacterBody2D

# CharacterBody2D class has certain properties that control the character
#   velocity -- the velocity of the characters movement, starts at (x=0,y=0)

var speed = 600

# called when the scene is ready
func _ready():
	randomize()
	var rng = RandomNumberGenerator.new()
	# randomly move ball left or right
	velocity.x = [-1,1][randi() % 2] * speed
	# move ball at a random starting angle
	velocity.y = rng.randf_range(-400,400)
	
# called every frame to move character
# delta is the amount of time that has passed since the last frame
func _physics_process(delta):
	# move_and_collide returns a collision object when it collides with another object
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
