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


#move_forward={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":87,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":90,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777232,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":12,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":1,"axis_value":-1.0,"script":null)
# ]
#}
#move_back={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":83,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777234,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":13,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":1,"axis_value":1.0,"script":null)
# ]
#}
#move_left={
#"deadzone": 0.51,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":65,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":81,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777231,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":14,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":0,"axis_value":-1.0,"script":null)
# ]
#}
#move_right={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":68,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777233,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":15,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":0,"axis_value":1.0,"script":null)
# ]
#}
