extends State


var player: Player


func _ready():
	yield(owner, "ready")
	player = state_parent as Player
	assert(player != null)


func unhandled_input(event):
	player.unhandled_input(event)


func process(delta):
	player.process(delta)
