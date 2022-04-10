extends ActionState


var player: Player


func _ready():
	yield(owner, "ready")
	player = owner as Player
	assert(player != null)
#	yield($"/root/World", "ready")
#	print(action_machine)


func input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_T:
			print("T was pressed")
