extends CanvasLayer

@onready var timer: Timer = $Timer
@onready var bg_image: TextureRect = $BgImage
@onready var main_actor: TextureRect = $MainActor/Image
@onready var main_actor_name: Label = $MainActor/MainActorDialogue/MainActorName
@onready var actor_name: Label = $ActorName
@onready var choices_box = $ChoicesBox
@onready var button: Button = $ChoicesBox/Button
@onready var avatar: TextureRect = $ActorDialogue/AvatarContainer/PanelAvatar/Avatar
@onready var dialogue = $ActorDialogue/AvatarContainer/Panel/Dialogue
@onready var main_dialogue: Label = $MainActor/MainActorDialogue/MainDialogue

var stage_info
var choosing = false

func init():
	stage_info = Transcripts.Stages[Playerstats.role_name]
	show_scenario(stage_info[Setting.stage_index]["scenario_list"][Setting.scenario_index])
	Setting.line_index += 1
	if stage_info[Setting.stage_index].has("common_market"):
		Setting.market_name = stage_info["common_market"]
	else:
		Setting.market_name = null
	if stage_info[Setting.stage_index].has("next_stage_index"):
		Setting.next_stage_index = stage_info[Setting.stage_index]["next_stage_index"]
	Setting.need_battle = false
	Setting.battle_field = null

func _unhandled_input(event: InputEvent):
	if self.visible and not choosing:
		if event.is_action_pressed("stage_next"):
			play_next_line()
		elif event.is_action_pressed("stage_back"):
			play_back_line()

func _on_back_pressed() -> void:
	if not choosing:
		play_back_line()

func _on_auto_pressed() -> void:
	if not choosing:
		if timer.is_stopped():
			timer.start(Setting.auto_interval)
		else:
			timer.stop()

func _on_fast_forward_pressed() -> void:
	if not choosing:
		if timer.is_stopped():
			timer.start(Setting.ff_interval)
		else:
			timer.stop()

func _on_skip_pressed() -> void:
	if not choosing:
		skip_to_next_choice()

func _on_setting_pressed():
	if not choosing:
		hide()
		Controller.show_settings()

func _on_next_pressed() -> void:
	if not choosing:
		play_next_line()

func _on_back_m_pressed():
	if not choosing:
		Controller.back_to_main()

func _on_timer_timeout() -> void:
	if not choosing:
		play_next_line()

func play_back_line():
	var current_stage = stage_info[Setting.stage_index]
	var scenario_list = current_stage["scenario_list"]
	if Setting.line_index > 0:
		Setting.line_index -= 1
		show_line(scenario_list[Setting.scenario_index]["line"][Setting.line_index])
	elif Setting.scenario_index > 0:
		Setting.scenario_index -= 1
		Setting.line_index = scenario_list[Setting.scenario_index]["line"].size() - 1
		show_scenario(scenario_list[Setting.scenario_index])

func play_next_line():
	var current_stage = stage_info[Setting.stage_index]
	var scenario_list = current_stage["scenario_list"]
	if Setting.line_index < len(scenario_list[Setting.scenario_index]["line"]):
		show_line(scenario_list[Setting.scenario_index]["line"][Setting.line_index])
		Setting.line_index += 1
	else:
		Setting.line_index = 0
		Setting.scenario_index += 1
		if Setting.scenario_index < len(scenario_list):
			show_scenario(scenario_list[Setting.scenario_index])
			Setting.line_index += 1
		elif Setting.need_battle:
			Setting.made_choices = []
			finish_stage()
			Controller.launch_battle()
		elif current_stage.has("end_stage"):
			Setting.made_choices = []
			finish_stage()
			Controller.game_over(current_stage["end_stage"])
		else:
			Setting.made_choices = []
			finish_stage()
			Controller.show_market()

func finish_stage():
	timer.stop()
	hide()

func show_scenario(scenario):
	if scenario.has("bg_image"):
		bg_image.texture = load(scenario["bg_image"])
	if scenario.has("bg_music"):
		Controller.play_music(scenario["bg_music"])
	else:
		main_actor.texture = null
	main_actor_name.text = ""
	actor_name.text = ""
	main_dialogue.text = ""
	dialogue.text = ""
	avatar.texture = null
	show_line(scenario["line"][Setting.line_index])

func show_line(line):
	# if line.has("sound"):
	# 	Controller.play_sound(line["sound"])
	if line.has("music"):
		Controller.play_music(line["music"])
	if line.has("dialogue"):
		if line["avatar"]:
			dialogue.text = line["dialogue"]
			if line.has("image"):
				avatar.texture = load(line["image"])
			avatar.self_modulate = Color(1,1,1,1)
			main_actor.self_modulate = Color(1,1,1,0.5)
			if line.has("name"):
				actor_name.text = line["name"]
		else:
			main_dialogue.text = line["dialogue"]
			if line.has("image"):
				main_actor.texture = load(line["image"])
			main_actor.self_modulate = Color(1,1,1,1)
			avatar.self_modulate = Color(1,1,1,0.5)
			if line.has("name"):
				main_actor_name.text = line["name"]
	if line.has("rewards"):
		if len(Setting.made_choices) > line["rewards"]["index"]:
			main_dialogue.text = Setting.made_choices[line["rewards"]["index"]]
			main_actor.self_modulate = Color(1,1,1,1)
			avatar.self_modulate = Color(1,1,1,0.5)
		else:
			choosing = true
			timer.stop()
			for j in line["rewards"]:
				if j != "index":
					var new_button = button.duplicate()
					new_button.show()
					new_button.get_node("Label").text = j
					new_button.pressed.connect(choose_reward.bind(j,line["rewards"][j]))
					choices_box.add_child(new_button)
	if line.has("choices"):
		if len(Setting.made_choices) > line["choices"]["index"]:
			main_dialogue.text = Setting.made_choices[line["choices"]["index"]]
		else:
			choosing = true
			timer.stop()
			for j in line["choices"]:
				if j != "index":
					var choice = line["choices"][j]
					var can_choose = true
					var fail_req = []
					if choice.has("req"):
						for key in choice["req"]:
							if Playerstats[key] < choice ["req"][key]:
								can_choose = false
								fail_req.append(key)
					var new_button = button.duplicate()
					new_button.show()
					if can_choose:
						new_button.get_node("Label").text = j
						new_button.pressed.connect(choose_choice.bind(j, choice))
					else:
						var fail_msg = " "
						for i in fail_req:
							fail_msg += i + "(" + str(choice ["req"][i]) + ")" + " "
						new_button.text = tr("K_ND") + fail_msg
					choices_box.add_child(new_button)

func choose_reward(reward_text, reward_dict):
	choosing = false
	Setting.made_choices.append(reward_text)
	var rewards = choices_box.get_children()
	for i in range(1, len(rewards)):
		choices_box.remove_child(rewards[i])
		rewards[i].queue_free()
	for j in reward_dict:
		if j == "item":
			Playerstats.add_item(reward_dict[j], 1)
		else:
			Playerstats[j] += reward_dict[j]
	play_next_line()

func choose_choice(choice_text, choice):
	choosing = false
	Setting.made_choices.append(choice_text)
	var choices = choices_box.get_children()
	for i in range(1, len(choices)):
		choices_box.remove_child(choices[i])
		choices[i].queue_free()
	if choice.has("next_stage_index"):
		Setting.next_stage_index = choice["next_stage_index"]
	if choice.has("battle_field"):
		Setting.need_battle = true	
		Setting.battle_field = choice["battle_field"]
	else:
		Setting.need_battle = false
	if choice.has("market"):
		Setting.market_name = choice["market"]
	play_next_line()


func skip_to_next_choice():
	var current_stage = stage_info[Setting.stage_index]
	var scenario_list = current_stage["scenario_list"]
	while Setting.scenario_index < len(scenario_list):
		var scenario = scenario_list[Setting.scenario_index]
		var lines = scenario["line"]
		while Setting.line_index < len(lines):
			var line = lines[Setting.line_index]
			if line.has("rewards") or line.has("choices"):
				show_scenario(scenario)
				Setting.line_index += 1
				return
			Setting.line_index += 1
		Setting.line_index = 0
		Setting.scenario_index += 1
	if Setting.scenario_index == len(scenario_list):
		Setting.made_choices = []
		if Setting.need_battle:
			finish_stage()
			Controller.launch_battle()
		elif current_stage.has("end_stage"):
			finish_stage()
			Controller.game_over(current_stage["end_stage"])
		else:
			finish_stage()
			Controller.show_market()
