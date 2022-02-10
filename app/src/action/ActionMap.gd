class_name ActionMap #extends InputMap


#var _action: String
#var _code = []
#var _input_event_key = [null, null]
#var _input_event_action = [null, null]

#var _input_event = {
#	"key":    InputEventKey,
#	"action": InputEventAction
#}


#func _init():
#	pass


func addAction(action: String, code=[]) -> void:
	var input_event_key    = [null, null]
	var input_event_action = [null, null]
	
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	
	for i in len(code):
		#InputEventJoypadButton
		input_event_action[i] = InputEventAction.new()
		input_event_action[i].action = action
		
		input_event_key[i] = InputEventKey.new()
		input_event_key[i].scancode = code[i]
		
		InputMap.action_add_event(action, input_event_key[i])
	
	return
