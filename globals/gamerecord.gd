extends Node


@export var records_info:Array

func _ready() -> void:
	if not DirAccess.dir_exists_absolute("user://records/"):
		DirAccess.make_dir_absolute("user://records/")
	if FileAccess.file_exists("user://records/records_info.json"):
		var saved_records_info = FileAccess.open("user://records/records_info.json", FileAccess.READ)
		var json_string = saved_records_info.get_as_text()
		var json = JSON.new()
		var _parse_result = json.parse(json_string)
		var parsed_data = json.get_data()
		records_info = parsed_data["records_info"]
	else:
		records_info = []

func update_record(record_index):
	var index = find_list_index(record_index)
	records_info[index].merge({
		"role_lv": Playerstats.K_LV,
		"level_mode" : Playerstats.level_mode,
		"date": Time.get_datetime_string_from_system()
	}, true)
	write_records_info()
	save_record(records_info[index]["record_path"])
	return index

func save_record(record_path):
	var save_record_file = FileAccess.open(record_path, FileAccess.WRITE)
	var playerinfo = generate_player_info()
	var json_string = JSON.stringify(playerinfo, "\t")
	save_record_file.store_line(json_string)

func load_record(record_index):
	var record_path = records_info[find_list_index(record_index)]["record_path"]
	var saved_record = FileAccess.open(record_path, FileAccess.READ)
	var json_string = saved_record.get_as_text()
	var json = JSON.new()
	var _parse_result = json.parse(json_string)
	var parsed_data = json.get_data()
	load_player_info(parsed_data)

func find_list_index(record_index):
	for i in range(len(records_info)):
		if records_info[i]["record_index"] == record_index:
			return i

func find_insert_position():
	for i in range(1,len(records_info)):
		if records_info[i]["record_index"] - records_info[i - 1]["record_index"] > 1:
			return records_info[i - 1]["record_index"] + 1
	return len(records_info)

func create_record():
	var record_index = find_insert_position()
	var record_path = "user://records/" + str(record_index) + ".save"
	records_info.append({
		"record_index": record_index,
		"record_path" : record_path,
		"role_name" : Playerstats.role_name,
		"level_mode" : Playerstats.level_mode,
		"role_lv": Playerstats.K_LV,
		"avatar" : Playerstats.avatar,
		"date": Time.get_datetime_string_from_system()
	})
	write_records_info()
	save_record(record_path)
	return record_index

func delete_record(record_index):
	var index = find_list_index(record_index)
	var record_path = records_info[index]["record_path"]
	records_info.remove_at(index)
	DirAccess.remove_absolute(record_path)
	write_records_info()
	return index

func write_records_info():
	var fa = FileAccess.open("user://records/records_info.json", FileAccess.WRITE)
	var json_string = JSON.stringify({"records_info": records_info}, "\t")
	fa.store_line(json_string)


func load_player_info(parsed_data):
	var playerinfo = parsed_data["playerinfo"]
	Playerstats.level_mode = playerinfo["level_mode"]
	Playerstats.role_name = playerinfo["role_name"]
	Playerstats.K_MAX_HP = playerinfo["K_MAX_HP"]
	Playerstats.K_HP = playerinfo["K_MAX_HP"]
	Playerstats.K_MAX_EXP  = playerinfo["K_MAX_EXP"]
	Playerstats.K_INFO = playerinfo["K_INFO"]
	Playerstats.K_INTELLIGENCE = playerinfo["K_INTELLIGENCE"]
	Playerstats.K_INFO_BOUND = playerinfo["K_INFO_BOUND"]
	Playerstats.K_INTELLIGENCE_BOUND = playerinfo["K_INTELLIGENCE_BOUND"]
	Playerstats.K_EXP = playerinfo["K_EXP"]
	Playerstats.K_HP_RECOVERY_RATE = playerinfo["K_HP_RECOVERY_RATE"]
	Playerstats.K_SPEED = playerinfo["K_SPEED"]
	Playerstats.K_ARMOR = playerinfo["K_ARMOR"]
	Playerstats.K_EFFICIENCY = playerinfo["K_EFFICIENCY"]
	Playerstats.K_EVASION = playerinfo["K_EVASION"]
	Playerstats.K_ACCURACY = playerinfo["K_ACCURACY"]
	Playerstats.K_CRIT_RATE = playerinfo["K_CRIT_RATE"]
	Playerstats.K_BOUNTY_GAIN = playerinfo["K_BOUNTY_GAIN"]
	Playerstats.K_EXP_GAIN = playerinfo["K_EXP_GAIN"]
	Playerstats.K_ELOQUENCY = playerinfo["K_ELOQUENCY"]
	Playerstats.K_AFFINITY = playerinfo["K_AFFINITY"]
	Playerstats.K_SANITY = playerinfo["K_SANITY"]
	Playerstats.bounty_count = playerinfo["bounty_count"]
	Playerstats.K_LV = playerinfo["K_LV"]
	Playerstats.K_UPGRADE_COUNT = playerinfo["K_UPGRADE_COUNT"]
	Playerstats.weapon_radius = playerinfo["weapon_radius"]
	Playerstats.avatar = playerinfo["avatar"]
	Playerstats.K_ADD_DMG = playerinfo["K_ADD_DMG"] 
	Playerstats.K_EXPL_RNG = playerinfo["K_EXPL_RNG"]
	Playerstats.K_EXPL_DMG = playerinfo["K_EXPL_DMG"]
	Playerstats.K_TP = playerinfo["K_TP"]
	Playerstats.K_RICO = playerinfo["K_RICO"]
	Playerstats.K_SPL = playerinfo["K_SPL"]
	Playerstats.hurt_audio = playerinfo["hurt_audio"]
	Playerstats.move_audio = playerinfo["move_audio"]
	Playerstats.pickup_audio = playerinfo["pickup_audio"]
	Playerstats.weapon_list = playerinfo["weapon_list"]
	Playerstats.itemDict = playerinfo["itemDict"]
	Playerstats.sp_dict = playerinfo["sp_dict"]
	var stageinfo = parsed_data["stageinfo"]
	Controller.game_start = stageinfo["game_start"]
	Controller.battle_start = stageinfo["battle_start"]
	Controller.market_start = stageinfo["market_start"]
	Setting.battle_field = stageinfo["battle_field"]
	Setting.need_battle = stageinfo["need_battle"]
	Setting.stage_index = stageinfo["stage_index"]
	Setting.next_stage_index = stageinfo["next_stage_index"]
	Setting.scenario_index = stageinfo["scenario_index"]
	Setting.line_index = stageinfo["line_index"]
	Setting.made_choices = stageinfo["made_choices"]

func generate_player_info():
	return {"playerinfo":{
		"level_mode": Playerstats.level_mode,
		"role_name": Playerstats.role_name,
		"K_MAX_HP" : Playerstats.K_MAX_HP,
		"K_HP" : Playerstats.K_MAX_HP,
		"K_MAX_EXP" : Playerstats.K_MAX_EXP,
		"K_INFO" : Playerstats.K_INFO,
		"K_EXP" : Playerstats.K_EXP,
		"K_HP_RECOVERY_RATE" : Playerstats.K_HP_RECOVERY_RATE,
		"K_SPEED" : Playerstats.K_SPEED,
		"K_ARMOR" : Playerstats.K_ARMOR,
		"K_EFFICIENCY" : Playerstats.K_EFFICIENCY,
		"K_EVASION" : Playerstats.K_EVASION,
		"K_ACCURACY" : Playerstats.K_ACCURACY,
		"K_CRIT_RATE" : Playerstats.K_CRIT_RATE,
		"K_BOUNTY_GAIN" : Playerstats.K_BOUNTY_GAIN,
		"K_EXP_GAIN" : Playerstats.K_EXP_GAIN,
		"K_INFO_BOUND" : Playerstats.K_INFO_BOUND,
		"K_INTELLIGENCE_BOUND" : Playerstats.K_INTELLIGENCE_BOUND,
		"K_ELOQUENCY" : Playerstats.K_ELOQUENCY,
		"K_AFFINITY" : Playerstats.K_AFFINITY,
		"K_SANITY" : Playerstats.K_SANITY,
		"K_INTELLIGENCE" : Playerstats.K_INTELLIGENCE,
		"bounty_count" : Playerstats.bounty_count,
		"K_LV" : Playerstats.K_LV,
		"K_UPGRADE_COUNT" : Playerstats.K_UPGRADE_COUNT,
		"weapon_radius" : Playerstats.weapon_radius,
		"avatar": Playerstats.avatar,
		"K_ADD_DMG": Playerstats.K_ADD_DMG, 
		"K_EXPL_RNG": Playerstats.K_EXPL_RNG,
		"K_EXPL_DMG": Playerstats.K_EXPL_DMG,
		"K_TP":Playerstats.K_TP,
		"K_RICO": Playerstats.K_RICO,
		"K_SPL":Playerstats.K_SPL,
		"hurt_audio":Playerstats.hurt_audio,
		"move_audio":Playerstats.move_audio,
		"pickup_audio":Playerstats.pickup_audio,
		"weapon_list" : Playerstats.weapon_list,
		"itemDict" : Playerstats.itemDict,
		"sp_dict" : Playerstats.sp_dict
	},
	"stageinfo":{
		"game_start": Controller.game_start,
		"battle_start": Controller.battle_start,
		"market_start": Controller.market_start,
		"need_battle": Setting.need_battle,
		"battle_field": Setting.battle_field,
		"stage_index" : Setting.stage_index,
		"next_stage_index": Setting.next_stage_index,
		"scenario_index": Setting.scenario_index,
		"line_index": Setting.line_index,
		"made_choices": Setting.made_choices
	}
}
