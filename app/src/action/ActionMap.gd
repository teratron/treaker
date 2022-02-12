class_name ActionMap


func addActionKey(action: String, code=[]) -> void:
	var hasAction := InputMap.has_action(action)
	var lengthCode = len(code)
	var inputEventKey = []
	inputEventKey.resize(lengthCode)
	
	if !hasAction:
		InputMap.add_action(action)
	
	for i in lengthCode:
		inputEventKey[i] = InputEventKey.new()
		inputEventKey[i].scancode = code[i]
		InputMap.action_add_event(action, inputEventKey[i])
	
	return


func addActionMouse(action: String, mask=[]) -> void:
	var hasAction := InputMap.has_action(action)
	var lengthCode = len(mask)
	var inputEventMouse = []
	inputEventMouse.resize(lengthCode)
	
	if !hasAction:
		InputMap.add_action(action)
	
	for i in lengthCode:
		inputEventMouse[i] = InputEventMouse.new()
		inputEventMouse[i].button_mask = mask[i]
		InputMap.action_add_event(action, inputEventMouse[i])
	
	return


func addActionJoypadButton(action: String, index=[]) -> void:
	var hasAction := InputMap.has_action(action)
	var lengthCode = len(index)
	var inputEventJoypadButton = []
	inputEventJoypadButton.resize(lengthCode)
	
	if !hasAction:
		InputMap.add_action(action)
	
	for i in lengthCode:
		inputEventJoypadButton[i] = InputEventJoypadButton.new()
		inputEventJoypadButton[i].button_index = index[i]
		InputMap.action_add_event(action, inputEventJoypadButton[i])
	
	return


func addActionJoypadMotion(action: String, axis: int, axis_value: float) -> void:
	var hasAction := InputMap.has_action(action)
	var inputEventJoypadMotion
	
	if !hasAction:
		InputMap.add_action(action)
	
	inputEventJoypadMotion = InputEventJoypadMotion.new()
	inputEventJoypadMotion.axis = axis
	inputEventJoypadMotion.axis_value = axis_value
	InputMap.action_add_event(action, inputEventJoypadMotion)
	
	return


func addActionList(list: Dictionary) -> void:
	for key in list:
		addActionKey(key as String, list[key] as Array)
		#print(key)
	
	return
