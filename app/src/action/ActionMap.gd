class_name ActionMap


func addActionMapList(list) -> void:
	match typeof(list):
		TYPE_DICTIONARY:
			_setActionMapItem(list)
		TYPE_ARRAY:
			for item in list:
				_setActionMapItem(item)
		_:
			printerr("error: map list not exist")
	return


func _setActionMapItem(item: Dictionary) -> void:
	if "action" in item:
		if !InputMap.has_action(item["action"]):
			InputMap.add_action(item["action"])
		
		if "deadzone" in item:
			InputMap.action_set_deadzone(item["action"], item["deadzone"])
		
		if "events" in item:
			var name: String
			for key in item["events"]:
				match key:
					InputEventKey:
						name = "_setActionKey"
					InputEventMouseButton:
						name = "_setActionMouseButton"
					InputEventJoypadButton:
						name = "_setActionJoypadButton"
					InputEventJoypadMotion:
						name = "_setJoypadMotion"
					_:
						printerr("error: unexpected results: ", key.to_string())
						continue
				
				_addActionEvent(funcref(self, name), item["action"], item["events"][key])
	else:
		printerr("error: action not exist")
	return


func _addActionEvent(function: FuncRef, action, value) -> void:
	match typeof(value):
		TYPE_INT, TYPE_DICTIONARY:
			function.call_func(action, value)
		TYPE_ARRAY:
			for i in len(value):
				function.call_func(action, value[i])
		_:
			 printerr("error: unexpected results: ", function.get_function())
	return


func _addAction(funcName: String, action: String, value) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_addActionEvent(funcref(self, funcName), action, value)
	return


# Keyboard
func addActionKey(action: String, code) -> void:
	_addAction("_setActionKey", action, code)
	return


func _setActionKey(action, code) -> void:
	var event = InputEventKey.new()
	event.scancode = code
	InputMap.action_add_event(action, event)
	return


# Mouse button
func addActionMouseButton(action: String, index) -> void:
	_addAction("_setActionMouseButton", action, index)
	return


func _setActionMouseButton(action, index) -> void:
	var event = InputEventMouseButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad button
func addActionJoypadButton(action: String, index) -> void:
	_addAction("_setActionJoypadButton", action, index)
	return


func _setActionJoypadButton(action, index) -> void:
	var event = InputEventJoypadButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad motion
func addActionJoypadMotion(action: String, axis: int, axis_value: float) -> void:
	_addAction("_setJoypadMotion", action, {"axis": axis, "axis_value": axis_value})
	return


func _setJoypadMotion(action, param) -> void:
	var event = InputEventJoypadMotion.new()
	event.axis = param.axis
	event.axis_value = param.axis_value
	InputMap.action_add_event(action, event)
	return
