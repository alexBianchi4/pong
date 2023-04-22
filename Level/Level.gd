extends Node

var player_score = 0
var opp_score = 0

func _ready():
	$Countdown.visible = false

# body (ball) enters GoalLeft area2D
func _on_goal_left_body_entered(body):
	opp_score += 1
	reset()

# body (ball) enters GoalRight area2D
func _on_goal_right_body_entered(body):
	player_score += 1
	reset()

# will be called whenever player_score or opp_score are changed
# using this to update scoreboard
func _process(delta):
	$Score.text = str(player_score) + ' - ' + str(opp_score)
	$Countdown.text = str(ceil($Timer.time_left))

func _on_timer_timeout():
	get_tree().call_group('BallGroup','start_ball')
	$Countdown.visible = false

func reset():
	# play score sound
	$ScoreSound.play()
	# put ball back to middle of screen
	$Ball.position = Vector2(640,360)
	# stop ball until timer reaches 0
	get_tree().call_group('BallGroup','stop_ball')
	# start timer
	$Countdown.visible = true
	$Timer.start()
