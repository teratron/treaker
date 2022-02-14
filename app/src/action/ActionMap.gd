class_name ActionMap


func addActionMapList(list) -> void:
	match typeof(list):
		TYPE_DICTIONARY:
			_setItemMap(list)
		TYPE_ARRAY:
			for item in list:
				_setItemMap(item)
		_:
			printerr("error: map list not exist")
	return


func _setItemMap(item: Dictionary) -> void:
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
func addActionKey(action: String, code: int) -> void:
	_addAction("_addKey", action, code)
	return


func _addKey(action, code) -> void:
	var event = InputEventKey.new()
	event.scancode = code
	InputMap.action_add_event(action, event)
	return


# Mouse button
func addActionMouseButton(action: String, index: int) -> void:
	_addAction("_addMouseButton", action, index)
	return


func _addMouseButton(action, index) -> void:
	var event = InputEventMouseButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad button
func addActionJoypadButton(action: String, index: int) -> void:
	_addAction("_addJoypadButton", action, index)
	return


func _addJoypadButton(action, index) -> void:
	var event = InputEventJoypadButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad motion
func addActionJoypadMotion(action: String, axis: int, axis_value: float) -> void:
	_addAction("_addJoypadMotion", action, {"axis": axis, "axis_value": axis_value})
	return


func _addJoypadMotion(action, param) -> void:
	var event = InputEventJoypadMotion.new()
	event.axis = param.axis
	event.axis_value = param.axis_value
	InputMap.action_add_event(action, event)
	return
