extends CharacterBody2D


# CharacterBody2D class has certain properties that control the character
#   velocity -- the velocity of the characters movement, starts at (x=0,y=0)
#   position -- the current x and y coords of the character

# a simple AI for the opponent
#   if ball is below opponent --> move down
#   if ball is above opponent --> move up
#   if the ball is slightly above/below don't move

var speed = 250
# keeps track of where the ball is
var ball

func _ready():
	# parent of Opponent node is the Level scene, who has a child node of Ball
	ball = get_parent().find_child("Ball")
		
func _physics_process(delta):
	velocity.y = get_opponent_dir() * speed
	move_and_slide()

# returns the direction along the y axis the opponent agent should move
func get_opponent_dir():
	# if there is a difference of 25 pixels between the ball and agents height then move
	if abs(ball.position.y - position.y) > 25:
		# return 1 if the ball is below the opponent, else -1
		return 1 if ball.position.y > position.y else -1
	else: return 0
