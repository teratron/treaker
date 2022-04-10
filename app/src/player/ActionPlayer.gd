extends ActionState


var player: Player
var ball:   RigidBody


func _ready():
	yield(owner, "ready")
	#prints(action_machine, action_parent, action_owner)
	#player = owner as Player
	player = action_parent as Player
	assert(player != null)
	ball = player.ball
	#yield(get_viewport(), "ready")
	#prints(action_machine, action_parent, action_owner)
	#prints(get_tree().root, get_viewport())
	#yield($"/root", "ready")
	#print(action_machine)


func unhandled_input(event):
	if event is InputEventKey || InputEventMouseButton:
		if event.is_action_pressed("use_shot"):
			if ball.status == ball.PARKED:
				ball.start(ball.transform.basis.y)
		
		if event.is_action_pressed("ui_pause"):
			ball.pause()
		
		if event.is_action_pressed("ui_restart"):
			if ball.status != ball.PARKED:
				ball.reset()
				player.ball_parked_position()
