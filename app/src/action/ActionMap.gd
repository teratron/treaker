class_name ActionMap


func addActionKey(action: String, code=null) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_addEventKey(action, code)
	return


func _addEventKey(action, code) -> void:
	match typeof(code):
		TYPE_NIL:
			return
		TYPE_INT:
			_addKey(action, code)
		TYPE_INT_ARRAY:
			for i in len(code):
				_addKey(action, code[i])
		_:
			 printerr("unexpected results")
	return


func _addKey(action, code) -> void:
	var event = InputEventKey.new()
	event.scancode = code
	InputMap.action_add_event(action, event)
	return


func addActionMouse(action: String, mask=null) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_addEventMouse(action, mask)
	return


func _addEventMouse(action, mask) -> void:
	match typeof(mask):
		TYPE_NIL:
			return
		TYPE_INT:
			_addMouse(action, mask)
		TYPE_INT_ARRAY:
			for i in len(mask):
				_addMouse(action, mask[i])
		_:
			 printerr("unexpected results")
	return


func _addMouse(action, mask) -> void:
	var event = InputEventMouse.new()
	event.button_mask = mask
	InputMap.action_add_event(action, event)
	return


func addActionJoypadButton(action: String, index=null) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_addEventJoypadButton(action, index)
	return


func _addEventJoypadButton(action, index) -> void:
	match typeof(index):
		TYPE_NIL:
			return
		TYPE_INT:
			_addJoypadButton(action, index)
		TYPE_INT_ARRAY:
			for i in len(index):
				_addJoypadButton(action, index[i])
		_:
			 printerr("unexpected results")
	return


func _addJoypadButton(action, index) -> void:
	var event = InputEventJoypadButton.new()
	event.button_index = index
	InputMap.action_add_event(action, event)
	return


func addActionJoypadMotion(action: String, axis: int=0, axis_value: float=0) -> void:
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	_addJoypadMotion(action, axis, axis_value)
	return


func _addJoypadMotion(action, axis, axis_value) -> void:
	var event = InputEventJoypadMotion.new()
	event.axis = axis
	event.axis_value = axis_value
	InputMap.action_add_event(action, event)
	return


func addActionMapList(list):
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
							_addEventKey(item["action"], item["events"][key])
						InputEventMouse:
							_addEventMouse(item["action"], item["events"][key])
						InputEventJoypadButton:
							_addEventJoypadButton(item["action"], item["events"][key])
						InputEventJoypadMotion:
							_addJoypadMotion(item["action"], item["events"][key].axis, item["events"][key].axis_value)
						_:
							printerr("error")
		else:
			printerr("action not exist")
	return
