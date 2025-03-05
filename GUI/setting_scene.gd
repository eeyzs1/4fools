extends CanvasLayer


@onready var auto_atk = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/CheckButtonContainer/AutoAtk
@onready var dis_dmg = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/CheckButtonContainer/DisDmg
@onready var es_label_value: Label = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/ESContainer/ESLabelValue
@onready var enemy_speed: HSlider = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/EnemySpeed
@onready var ed_label_value: Label = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/EDContainer/EDLabelValue
@onready var enemy_dmg: HSlider = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/EnemyDmg
@onready var esp_label_value: Label = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/ESPContainer/ESPLabelValue
@onready var enemy_sp: HSlider = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/EnemySP
@onready var egep_label_value: Label = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/EGEPContainer/EGEPLabelValue
@onready var egep: HSlider = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/EGEP
@onready var mea_label_value: Label = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/MEAContainer/MEALabelValue
@onready var mea: HSlider = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/MEA
@onready var mexpg_value = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/MEXPGContainer/MEXPGValue
@onready var mexpg = $TabContainer/K_GN_CONTROL/MarginContainer/Generalbox/MEXPG

@onready var window_mode_ops: OptionButton = $TabContainer/K_VA_CTRL/Videobox/HSplitContainer/WindowModeOps
@onready var resolutions_ops: OptionButton = $TabContainer/K_VA_CTRL/Videobox/HSplitContainer2/ResolutionsOps
@onready var music_label_value: Label = $TabContainer/K_VA_CTRL/Audiobox/MusicContainer/MusicLabelValue
@onready var music_volume: HSlider = $TabContainer/K_VA_CTRL/Audiobox/MusicVolume
@onready var sound_label_value: Label = $TabContainer/K_VA_CTRL/Audiobox/SoundContainer/SoundLabelValue
@onready var sound_volume: HSlider = $TabContainer/K_VA_CTRL/Audiobox/SoundVolume

@onready var action_list: VBoxContainer = $TabContainer/K_GM_CONTROL/ActionList
@onready var input_button_scene = preload("res://GUI/input_button.tscn")



var is_remapping = false
var action_to_remap = null
var remapping_button = null

const ACTION_INPUT_TRANS_MAP:Dictionary = {
		"move_up":"K_MV_UP",
		"move_left":"K_MV_LEFT", 
		"move_down":"K_MV_DOWN",
		"move_right":"K_MV_RIGHT",
		"shoot":"K_SHOOT",
		"sp":"K_SP"
	}

const WINDOW_MODE_ARRAY:Array[String] = [
	"K_FULLSRN",#FULL-SCREEN
	"K_WDMODE",#WINDOW MODE
	"K_BLWD",#BORDERLESS WINDOW
	"K_DLFULLSRN"#BORDERLESS FULL SCREEN
]

const RESOLUTIONS_DICT:Dictionary = {
	"1920x1080":Vector2i(1920,1080),
	"1768x992":Vector2i(1768,992),
	"1600x900":Vector2i(1600,900),
	"1366x768":Vector2i(1366,768),
	"1280x720":Vector2i(1280,720),
	"1176x664":Vector2i(1176,664),
	"640x480":Vector2i(640,480)
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func init():
	es_label_value.text = str(Setting.enemy_speed)
	enemy_speed.value = Setting.enemy_speed
	ed_label_value.text = str(Setting.enemy_damage)
	enemy_dmg.value = Setting.enemy_damage
	esp_label_value.text = str(Setting.enemy_spawn_period)
	enemy_sp.value = Setting.enemy_spawn_period
	egep_label_value.text = str(Setting.enemy_gen_amt_et)
	egep.value = Setting.enemy_gen_amt_et
	mea_label_value.text = str(Setting.max_enemy_amt)
	mea.value = Setting.max_enemy_amt
	mexpg_value.text = str(Setting.max_exp_growth)
	mexpg.value = Setting.max_exp_growth

	call_deferred("set_volume")
	auto_atk.button_pressed = !Setting.munually_attack
	dis_dmg.button_pressed = Setting.dmg_display
	add_resolution_items()
	add_window_mode_items()
	window_mode_ops.item_selected.connect(on_window_mode_selected)
	window_mode_ops.selected = Setting.window_mode
	on_window_mode_selected(Setting.window_mode)
	set_InputMap()
	create_action_list()

func set_InputMap():
	var input_map = Setting.input_map
	for action in input_map:
		var event
		var event_str = input_map[action]
		if event_str.contains("mouse_"):
			event = InputEventMouseButton.new()
			event.button_index = int(event_str.split("_")[1])
		else:
			event = InputEventKey.new()
			event.keycode = OS.find_keycode_from_string(event_str)
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)

func create_action_list():
	for i in action_list.get_children():
		i.queue_free()
	
	for action in  Setting.input_map:
		var button = input_button_scene.instantiate()
		var action_label = button.find_child("Action")
		var input_label = button.find_child("Input")
		action_label.text = ACTION_INPUT_TRANS_MAP[action]
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			input_label.text = events[0].as_text()
		else:
			input_label.text = ""
		action_list.add_child(button)
		button.pressed.connect(input_button_pressed.bind(button, action))

func input_button_pressed(button, action):
	if !is_remapping:
		is_remapping = true
		action_to_remap = action
		remapping_button = button
		button.find_child("Input").text = "K_BIND_KEY"

func _input(event):
	if is_remapping:
		if event is InputEventKey || (event is InputEventMouseButton and event.pressed):
			if event is InputEventMouseButton and event.double_click:
				event.double_click = false
			InputMap.action_erase_events(action_to_remap)
			InputMap.action_add_event(action_to_remap,event)
			remapping_button.find_child("Input").text = event.as_text()
			if event is InputEventKey:
				Setting.input_map[action_to_remap] = OS.get_keycode_string(event.physical_keycode)
			elif event is InputEventMouseButton:
				Setting.input_map[action_to_remap] = "mouse_" + str(event.button_index)
			remapping_button.accept_event()
			is_remapping = false
			action_to_remap = null
			remapping_button = null

func set_volume():
	music_label_value.text = str(Setting.music_volume)
	music_volume.value = Setting.music_volume
	sound_label_value.text = str(Setting.sound_volume)
	sound_volume.value = Setting.sound_volume

func add_resolution_items() -> void:
	var res_keys = RESOLUTIONS_DICT.keys()
	var selected_index = -1
	for index in range(res_keys.size()):
		var key = res_keys[index]
		resolutions_ops.add_item(key)#key
		if RESOLUTIONS_DICT[key].x == Setting.resolution_x and RESOLUTIONS_DICT[key].y == Setting.resolution_y:
			selected_index = index
	if selected_index == -1:
		selected_index = res_keys.size()
		resolutions_ops.add_item(str(Setting.resolution_x)+"x"+str(Setting.resolution_y))

	resolutions_ops.item_selected.connect(on_resolution_selected)
	resolutions_ops.selected = selected_index
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
	DisplayServer.window_set_size(Vector2i(Setting.resolution_x,Setting.resolution_y))
	get_window().move_to_center()

func update_resolution_item():
	var expected_index = RESOLUTIONS_DICT.keys().size()
	var res_keys = RESOLUTIONS_DICT.keys()
	var selected_index = -1
	for index in range(expected_index):
		var key = res_keys[index]
		if RESOLUTIONS_DICT[key].x == Setting.resolution_x and RESOLUTIONS_DICT[key].y == Setting.resolution_y:
			selected_index = index
	if selected_index == -1:
		if resolutions_ops.get_selectable_item(true) == expected_index:
			resolutions_ops.set_item_text(expected_index, str(Setting.resolution_x)+"x"+str(Setting.resolution_y))
		else:
			resolutions_ops.add_item(str(Setting.resolution_x)+"x"+str(Setting.resolution_y))
		resolutions_ops.selected = expected_index
	else:
		resolutions_ops.selected = selected_index

func on_resolution_selected(index:int) ->	void:
	if index < RESOLUTIONS_DICT.keys().size() and (Setting.window_mode == 1 or Setting.window_mode == 2):
		Setting.resolution_x = RESOLUTIONS_DICT.values()[index].x
		Setting.resolution_y = RESOLUTIONS_DICT.values()[index].y
		if resolutions_ops.get_selectable_item(true) == RESOLUTIONS_DICT.keys().size():
			resolutions_ops.set_item_text(RESOLUTIONS_DICT.keys().size(), str(Setting.resolution_x)+"x"+str(Setting.resolution_y))
		DisplayServer.window_set_size(RESOLUTIONS_DICT.values()[index])
		get_window().move_to_center()

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		window_mode_ops.add_item(window_mode)

func on_window_mode_selected(index:int) ->	void:
	Setting.window_mode = index
	var x = Setting.resolution_x
	var y = Setting.resolution_y
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
		3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
	update_resolution_item()
	DisplayServer.window_set_size(Vector2i(x,y))
	get_window().move_to_center()


func _on_enemy_speed_value_changed(value: float) -> void:
	Setting.enemy_speed = value
	es_label_value.text = str(value)

func _on_enemy_dmg_value_changed(value: float) -> void:
	Setting.enemy_damage = value
	ed_label_value.text = str(value)

func _on_back_button_pressed() -> void:
	Controller.settings_back()

func _on_music_volume_value_changed(value: int) -> void:
	Setting.music_volume = value
	if value == 0:
		Controller.music.volume_db = -80
	else:
		Controller.music.volume_db = linear_to_db(value)
	music_label_value.text = str(value)

func _on_sound_volume_value_changed(value: int) -> void:
	Setting.sound_volume = value
	if value == 0:
		Controller.sound.volume_db = -80
	else:
		Controller.sound.volume_db = linear_to_db(value)
	Controller.ui_focus_sound.volume_db = value
	Controller.ui_click_sound.volume_db = value
	Controller.play_ui_click_sound()
	get_tree().call_group("weapons", "set_volume", value)
	get_tree().call_group("enemies", "set_volume", value)
	get_tree().call_group("snpc", "set_volume", value)
	get_tree().call_group("player", "set_volume", value)
	sound_label_value.text = str(value)

func _on_auto_atk_toggled(toggled_on: bool) -> void:
	Setting.munually_attack = ! toggled_on

func _on_dis_dmg_toggled(toggled_on: bool) -> void:
	Setting.dmg_display = toggled_on

func _on_enemy_sp_value_changed(value: float) -> void:
	Setting.enemy_spawn_period = value
	esp_label_value.text = str(value)

func _on_egep_value_changed(value: float) -> void:
	Setting.enemy_gen_amt_et = value
	egep_label_value.text = str(value)

func _on_mea_value_changed(value: float) -> void:
	Setting.max_enemy_amt = value
	mea_label_value.text = str(value)

func _on_mexpg_value_changed(value):
	Setting.max_exp_growth = value
	mexpg_value.text = str(value)

func _on_reset_button_pressed() -> void:
	Setting.reset_config() # Replace with function body.
	es_label_value.text = str(Setting.enemy_speed)
	enemy_speed.value = Setting.enemy_speed
	ed_label_value.text = str(Setting.enemy_damage)
	enemy_dmg.value = Setting.enemy_damage
	esp_label_value.text = str(Setting.enemy_spawn_period)
	enemy_sp.value = Setting.enemy_spawn_period
	egep_label_value.text = str(Setting.enemy_gen_amt_et)
	egep.value = Setting.enemy_gen_amt_et
	mea_label_value.text = str(Setting.max_enemy_amt)
	mea.value = Setting.max_enemy_amt
	mexpg_value.text = str(Setting.max_exp_growth)
	mexpg.value = Setting.max_exp_growth

	call_deferred("set_volume")
	auto_atk.button_pressed = !Setting.munually_attack
	dis_dmg.button_pressed = Setting.dmg_display
	window_mode_ops.selected = Setting.window_mode
	on_window_mode_selected(Setting.window_mode)
	set_InputMap()
	create_action_list()
