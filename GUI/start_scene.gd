extends Node2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var credit_text = $CanvasLayer/TextureRect/CreditButton/CreditText
@onready var action_list: VBoxContainer = $CanvasLayer/TextureRect/OpButton/ActionList
@onready var input_button_scene = preload("res://GUI/input_button.tscn")

const ACTION_INPUT_TRANS_MAP:Dictionary = {
		"move_up":"K_MV_UP",
		"move_left":"K_MV_LEFT", 
		"move_down":"K_MV_DOWN",
		"move_right":"K_MV_RIGHT",
		"shoot":"K_SHOOT",
		"sp":"K_SP"
	}

# Called when the node enters the scene tree for the first time.
func _ready():
	#$RoleSelection.hide()
	$RoleCustomization.hide()

func _on_story_button_pressed():
	canvas_layer.hide()
	#$RoleSelection.show()
	Playerstats.init_player(Playerstats.story_template.duplicate())
	Controller.start_game()

func _on_level_button_pressed():
	canvas_layer.hide()
	$RoleCustomization.init()
	$RoleCustomization.show()

func _on_chinese_button_pressed() -> void:
	Setting.locale = "chn"

func _on_english_button_pressed() -> void:
	Setting.locale =  "en"

func _on_exit_button_pressed() -> void:
	Controller.exit_game()

func _on_load_game_button_pressed() -> void:
	canvas_layer.hide()
	Controller.load_save_game()

func _on_set_game_button_pressed() -> void:
	canvas_layer.hide()
	Controller.show_settings()

func _on_credit_button_pressed():
	if credit_text.visible:
		credit_text.hide()
	else:
		credit_text.show()

func _on_op_button_pressed() -> void:
	if action_list.visible:
		action_list.hide()
	else:
		create_action_list()
		action_list.show()


func create_action_list():
	for i in action_list.get_children():
		i.queue_free()
	
	for action in  Setting.input_map:
		var button = input_button_scene.instantiate()
		var action_label = button.find_child("Action")
		var input_label = button.find_child("Input")
		action_label.text = ACTION_INPUT_TRANS_MAP[action]
		var events = InputMap.action_get_events(action)
		action_label["theme_override_colors/font_outline_color"] = Color(255,255,255,255)
		action_label["theme_override_constants/outline_size"] = 5
		action_label["theme_override_colors/font_color"] = Color(0,0,0,255)
		input_label["theme_override_colors/font_outline_color"] = Color(255,255,255,255)
		input_label["theme_override_constants/outline_size"] = 5
		input_label["theme_override_colors/font_color"] = Color(0,0,0,255)
		if events.size() > 0:
			input_label.text = events[0].as_text()
		else:
			input_label.text = ""
		action_list.add_child(button)
