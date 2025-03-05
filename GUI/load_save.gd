extends CanvasLayer

@onready var record: Button = $RecordsPanel/MarginContainer/ScrollContainer/RecordList/Record
@onready var record_list: VBoxContainer = $RecordsPanel/MarginContainer/ScrollContainer/RecordList

@onready var record_index = null

func init() -> void:
	var rcd_cds = record_list.get_children()
	for i in range(1, len(rcd_cds)):
		record_list.remove_child(rcd_cds[i])
		rcd_cds[i].queue_free()
	for i in range(0, len(Gamerecord.records_info)):
		if i == 0:
			var quick_record_info = Gamerecord.records_info[0]
			record.get_node("RoleAvatar").texture = load(quick_record_info["avatar"])
			if quick_record_info["level_mode"]:
				record.get_node("RecordDesc").text = tr("K_LEVEL_MODE")+str(quick_record_info["level_mode"]) \
				+ "\n" + quick_record_info["date"]
			else:
				record.get_node("RecordDesc").text = tr("K_LV")+str(quick_record_info["role_lv"]) + " " \
				+ tr(quick_record_info["role_name"]) + "\n" + quick_record_info["date"]
			if record.pressed.is_connected(choose_record):
				record.pressed.disconnect(choose_record)
			record.pressed.connect(choose_record.bind(quick_record_info["record_index"]))
		else:
			var record_info = Gamerecord.records_info[i]
			var new_record = record.duplicate()
			new_record.show()
			new_record.get_node("RoleAvatar").texture = load(record_info["avatar"])
			if record_info["level_mode"]:
				new_record.get_node("RecordDesc").text = tr("K_LEVEL_MODE")+str(record_info["level_mode"]) \
				+ "\n" + record_info["date"]
			else:
				new_record.get_node("RecordDesc").text = tr("K_LV")+str(record_info["role_lv"]) + " " \
				+ tr(record_info["role_name"]) + "\n" + record_info["date"]
			if new_record.pressed.is_connected(choose_record):
				new_record.pressed.disconnect(choose_record)
			new_record.pressed.connect(choose_record.bind(record_info["record_index"]))
			record_list.add_child(new_record)

func choose_record(index) -> void:
	if record_index != null:
		var previous_record = record_list.get_children()[Gamerecord.find_list_index(record_index)]
		previous_record["self_modulate"] = Color8(255,255,255,125)
	record_index = index
	var target_record = record_list.get_children()[Gamerecord.find_list_index(record_index)]
	target_record["self_modulate"] = Color8(255,255,255,255)

func _on_quick_save_game_button_pressed() -> void:
	if len(Gamerecord.records_info) == 0:
		create_new_record()
	var index = 0
	Gamerecord.update_record(Gamerecord.records_info[0]["record_index"])
	var target_record = record_list.get_children()[index]
	var record_info = Gamerecord.records_info[index]
	if record_info["level_mode"]:
		target_record.get_node("RecordDesc").text = tr("K_LEVEL_MODE")+str(record_info["level_mode"]) \
		+ "\n" + record_info["date"]
	else:
		target_record.get_node("RecordDesc").text = tr("K_LV")+str(record_info["role_lv"]) + " " \
		+ tr(record_info["role_name"]) + "\n" + record_info["date"]
	target_record.get_node("RoleAvatar").texture = load(record_info["avatar"])

func _on_quick_load_game_button_pressed() -> void:
	if len(Gamerecord.records_info) == 0:
		return
	Gamerecord.load_record(Gamerecord.records_info[0]["record_index"])
	record_index = null
	hide()
	Controller.launch_player()

func _on_save_game_button_pressed() -> void:
	if len(Gamerecord.records_info) == 0:
		create_new_record()
	if not record_index:
		record_index = Gamerecord.records_info[0]["record_index"]
	var index = Gamerecord.update_record(record_index)
	var target_record = record_list.get_children()[index]
	var record_info = Gamerecord.records_info[index]
	if record_info["level_mode"]:
		target_record.get_node("RecordDesc").text = tr("K_LEVEL_MODE")+str(record_info["level_mode"]) \
		+ "\n" + record_info["date"]
	else:
		target_record.get_node("RecordDesc").text = tr("K_LV")+str(record_info["role_lv"]) + " " \
		+ tr(record_info["role_name"]) + "\n" + record_info["date"]
	target_record.get_node("RoleAvatar").texture = load(record_info["avatar"])
	record_index = null

func _on_load_game_button_pressed() -> void:
	if len(Gamerecord.records_info) == 0:
		return
	if not record_index:
		record_index = Gamerecord.records_info[0]["record_index"]
	Gamerecord.load_record(record_index)
	hide()
	Controller.launch_player()

func _on_new_record_button_pressed() -> void:
	create_new_record()

func create_new_record():
	var index = Gamerecord.create_record()
	var new_record = record.duplicate()
	new_record.show()
	new_record.get_node("RoleAvatar").texture = load(Playerstats.avatar)
	if Playerstats.level_mode:
		new_record.get_node("RecordDesc").text = tr("K_LEVEL_MODE")+str(Playerstats.level_mode) \
		+ "\n" + Time.get_datetime_string_from_system()
	else:
		new_record.get_node("RecordDesc").text = tr("K_LV")+str(Playerstats.K_LV) + " " \
		+ tr(Playerstats.role_name) + "\n" + Time.get_datetime_string_from_system()
	new_record.pressed.connect(choose_record.bind(index))
	record_list.add_child(new_record)

func _on_delete_record_button_pressed() -> void:
	if len(Gamerecord.records_info) == 0:
		return
	if not record_index:
		record_index = Gamerecord.records_info[0]["record_index"]
	var records = record_list.get_children()
	if len(records) > 1:
		var index = Gamerecord.delete_record(record_index)
		record_list.remove_child(records[index])
		records[index].queue_free()
		record_index = null

func _on_back_button_pressed() -> void:
	Controller.load_save_back()
