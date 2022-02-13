class_name ActionMap


func addActionMapList(list) -> void:
	var name: String
	for item in list:
		if "action" in item:
			if !InputMap.has_action(item["action"]):
				InputMap.add_action(item["action"])
			
			if "deadzone" in item:
				InputMap.action_set_deadzone(item["action"], item["deadzone"])
			
			if "events" in item:
				for key in item["events"]:
					match key:
						InputEventKey:
							name = "_addKey"
						InputEventMouseButton:
							name = "_addMouseButton"
						InputEventJoypadButton:
							name = "_addJoypadButton"
						InputEventJoypadMotion:
							name = "_addJoypadMotion"
						_:
							printerr("error: unexpected results: ", key.to_string())
							continue
					
					_addActionEvent(funcref(self, name), item["action"], item["events"][key])
		else:
			printerr("error: action not exist")
	return


func _addAction(funcName: String, action: String, value) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_addActionEvent(funcref(self, funcName), action, value)
	return


func _addActionEvent(function: FuncRef, action, value) -> void:
	match typeof(value):
		TYPE_NIL:
			return
		TYPE_INT, TYPE_DICTIONARY:
			function.call_func(action, value)
		TYPE_ARRAY:
			for i in len(value):
				function.call_func(action, value[i])
		_:
			 printerr("error: unexpected results: ", function.get_function())
	return


# Keyboard
func addActionKey(action: String, code) -> void:
	_addAction("_addKey", action, code)
	return


func _addKey(action, code) -> void:
	var event = InputEventKey.new()
	event.scancode = code
	InputMap.action_add_event(action, event)
	return


# Mouse button
func addActionMouseButton(action: String, index) -> void:
	_addAction("_addMouseButton", action, index)
	return


func _addMouseButton(action, index) -> void:
	var event = InputEventMouseButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad button
func addActionJoypadButton(action: String, index) -> void:
	_addAction("_addJoypadButton", action, index)
	return


func _addJoypadButton(action, index) -> void:
	var event = InputEventJoypadButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad motion
func addActionJoypadMotion(action: String, axis: int=0, axis_value: float=0) -> void:
	_addAction("_addJoypadMotion", action, {"axis": axis, "axis_value": axis_value})
	return


func _addJoypadMotion(action, param) -> void:
	var event = InputEventJoypadMotion.new()
	event.axis = param.axis
	event.axis_value = param.axis_value
	InputMap.action_add_event(action, event)
	return
