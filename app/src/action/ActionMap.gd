class_name ActionMap


func add_action_map_list(list) -> void:
	match typeof(list):
		TYPE_DICTIONARY:
			_set_action_map_item(list)
		TYPE_ARRAY:
			for item in list:
				_set_action_map_item(item)
		_:
			printerr("error: map list not exist")
	return


func _set_action_map_item(item: Dictionary) -> void:
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
						name = "_set_action_key"
					InputEventMouseButton:
						name = "_set_action_mouse_button"
					InputEventJoypadButton:
						name = "_set_action_joypad_button"
					InputEventJoypadMotion:
						name = "_set_action_joypad_motion"
					_:
						printerr("error: unexpected results: ", key.to_string())
						continue
				
				_add_action_event(funcref(self, name), item["action"], item["events"][key])
	else:
		printerr("error: action not exist")
	return


func _add_action_event(function: FuncRef, action: String, value) -> void:
	match typeof(value):
		TYPE_INT, TYPE_DICTIONARY:
			function.call_func(action, value)
		TYPE_ARRAY:
			for i in len(value):
				function.call_func(action, value[i])
		_:
			 printerr("error: unexpected results: ", function.get_function())
	return


func _add_action(funcName: String, action: String, value) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_add_action_event(funcref(self, funcName), action, value)
	return


# Keyboard
func add_action_key(action: String, code) -> void:
	_add_action("_set_action_key", action, code)
	return


func _set_action_key(action: String, code) -> void:
	var event = InputEventKey.new()
	event.scancode = code
	InputMap.action_add_event(action, event)
	return


# Mouse button
func add_action_mouse_button(action: String, index) -> void:
	_add_action("_set_action_mouse_button", action, index)
	return


func _set_action_mouse_button(action: String, index) -> void:
	var event = InputEventMouseButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad button
func add_action_joypad_button(action: String, index) -> void:
	_add_action("_set_action_joypad_button", action, index)
	return


func _set_action_joypad_button(action: String, index) -> void:
	var event = InputEventJoypadButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


# Joypad motion
func add_action_joypad_motion(action: String, axis: int, axis_value: float) -> void:
	_add_action("_set_action_joypad_motion", action, {"axis": axis, "axis_value": axis_value})
	return


func _set_action_joypad_motion(action: String, param) -> void:
	var event = InputEventJoypadMotion.new()
	event.axis = param.axis
	event.axis_value = param.axis_value
	InputMap.action_add_event(action, event)
	return
