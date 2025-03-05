extends Node2D


@onready var hud = Controller.hud

@export var level_mode :int = 0
@export var role_name :String
@export var stage_index :int
@export var K_LV :int = 1: 
	set(val):
		K_UPGRADE_COUNT += (val - K_LV)
		K_LV = val

@export var K_MAX_EXP :int = 100
@export var K_MAX_HP :int:
	set(val):
		K_MAX_HP = val
		hud.hp_bar.max_value = K_MAX_HP
@export var K_HP_RECOVERY_RATE :int

@export var K_EVASION :int
@export var K_BOUNTY_GAIN :int
@export var K_EXP_GAIN :int
@export var K_ELOQUENCY :int
@export var K_AFFINITY :int

@export var K_INFO:int:
	set(val):
		while val > K_INFO_BOUND:
			K_BOUNTY_GAIN += 20
			K_ELOQUENCY += 20
			K_INFO_BOUND += 50
		K_INFO = val

@export var K_INTELLIGENCE:int:
	set(val):
		while val > K_INTELLIGENCE_BOUND:
			K_EXP_GAIN += 20
			K_SANITY += 20
			K_INTELLIGENCE_BOUND += 50
		K_INTELLIGENCE = val

@export var K_INFO_BOUND:int = 100

@export var K_INTELLIGENCE_BOUND:int = 100

@export var K_SANITY :int:
	set(val):
		K_SANITY = val
		if val < 0:
			Controller.play_music("res://asset/music/stage/Beyond The Sun.ogg")
			Controller.game_over("SAN0")

@export var K_EFFICIENCY :int
@export var K_ARMOR :int
@export var K_SPEED :int:
	set(val):
		if val < 0:
			K_SPEED = 0
		else:
			K_SPEED = val

@export var K_ACCURACY :int:
	set(val):
		for i in weapon_list:
			i["K_ACCURACY"] += (val - K_ACCURACY)
		K_ACCURACY = val

@export var K_CRIT_RATE :int:
	set(val):
		for i in weapon_list:
			i["K_CRIT_RATE"] += (val - K_CRIT_RATE)
		K_CRIT_RATE = val

@export var K_HP :int:
	set(val):
		K_HP = min(val, K_MAX_HP)
		if K_HP <= 0:
			Controller.battle_failed()
			Controller.player.timer.stop()
		hud.hp_bar.max_value = K_MAX_HP
		hud.hp_bar.value = K_HP
		hud.hp_val_label.text = str(K_HP)+"/"+str(K_MAX_HP)

@export var bounty_count: int = 0:
	set(value):
		bounty_count = value
		hud.bounty_count.text = str(value)

@export var K_UPGRADE_COUNT :int:
	set(val):
		K_UPGRADE_COUNT = val
		hud.lv_up_count.text = str(K_UPGRADE_COUNT)

@export var K_EXP :int:
	set(val):
		val += K_EXP_GAIN
		while val >= K_MAX_EXP:
			K_LV += 1
			val -= K_MAX_EXP
			K_MAX_EXP = int(Setting.max_exp_growth * K_MAX_EXP)
		K_EXP = val
		hud.exp_bar.value = K_EXP
		hud.exp_bar.max_value = K_MAX_EXP
		hud.exp_val_label.text = str(K_EXP)+"/"+str(K_MAX_EXP)

@export var weapon_radius = 22
@export var weapon_scene= preload("res://weapon.tscn")
@export var avatar = "res://asset/main_character/IC/avatar.png"

@export var itemDict = {}

@export var K_ADD_DMG:int:
	set(val):
		for i in weapon_list:
			i["K_ATK"] += (val - K_ADD_DMG)
		K_ADD_DMG = val

@export var K_EXPL_RNG:int:
	set(val):
		for i in weapon_list:
			i["K_EXPL_RNG"] += (val - K_EXPL_RNG)
		K_EXPL_RNG = val

@export var K_EXPL_DMG:int:
	set(val):
		for i in weapon_list:
			i["K_EXPL_DMG"] += (val - K_EXPL_DMG)
		K_EXPL_DMG = val

@export var K_TP:int:
	set(val):
		for i in weapon_list:
			i["K_TP"] += (val - K_TP)
		K_TP = val

@export var K_RICO:int:
	set(val):
		for i in weapon_list:
			i["K_RICO"] += (val - K_RICO)
		K_RICO = val

@export var K_SPL:int:
	set(val):
		for i in weapon_list:
			i["K_SPL"] += (val - K_SPL)
		K_SPL = val

@export var hurt_audio:String
@export var move_audio:String
@export var pickup_audio:String

var weapon_list:Array = []
var sp_dict = null

const story_template = {
		"role_name":"N_IC",
		"desc":"K_IC_INTRO",
		"level_mode" : 0,
		"attr_points":0,
		"stage_index" : 1,
		"K_MAX_HP" : 500,
		"K_HP" : 500,
		"K_MAX_EXP" : 100,
		"K_EXP" : 0,
		"K_ARMOR" : 3,
		"K_HP_RECOVERY_RATE" : 10,
		"K_INFO" : 0,
		"K_SPEED" : 100,
		"K_EFFICIENCY" : 0,
		"K_EVASION" : 20,
		"K_ACCURACY" : 20,
		"K_CRIT_RATE" : 20,
		"K_BOUNTY_GAIN" : 5,
		"K_EXP_GAIN" : 5,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 10,
		"K_INTELLIGENCE" : 10,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"bounty_count" : 111,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 25,
		"K_ADD_DMG": 10, 
		"K_EXPL_RNG": 0,
		"K_EXPL_DMG": 0,
		"K_TP":1,
		"K_RICO": 0,#跳弹
		"K_SPL":0,
		"avatar": "res://asset/main_character/IC/avatar.png",
		"hurt_audio":"res://asset/main_character/IC/sound/hurt.wav",
		"move_audio":"res://asset/main_character/IC/sound/Spaceship_1.wav",
		"pickup_audio":"res://asset/main_character/IC/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0}
		],
		"itemDict": {
		},
		"sp_dict":{
			"sp_cd": 20,
			"sp_auto": false,
			"sp_period":10,
			"sp_start":"bullet_speed_slow",
			"sp_end":"bullet_speed_norlmal",
		}
	}

func add_item(key,value):
	var item = Setting.Items[key]
	if itemDict.has(key):
		itemDict[key] += value
	else:
		itemDict[key] = value
	for i in item.keys():
		if typeof(item[i]) != TYPE_STRING:
			self[i] += (value * item[i])

func remove_item(key,value):
	var item = Setting.Items[key]
	itemDict[key] -= value
	for i in item.keys():
		if typeof(item[i]) != TYPE_STRING:
			self[i] -= value * item[i]

func add_weapon(weapon_data):
	weapon_list.append(weapon_data)
	weapon_list[-1]["K_ATK"] = weapon_list[-1]["K_ATK"] * pow(2, weapon_list[-1]["K_LV"]-1) + weapon_list[-1]["K_LV"]*weapon_list[-1]["K_GROWTH"] + Playerstats.K_ADD_DMG
	weapon_list[-1]["K_ATK_INTVL"] = weapon_data["K_ATK_INTVL"]
	weapon_list[-1]["K_EXPL_RNG"] += Playerstats.K_EXPL_RNG
	weapon_list[-1]["K_EXPL_DMG"] += Playerstats.K_EXPL_DMG
	weapon_list[-1]["K_TP"] += Playerstats.K_TP
	weapon_list[-1]["K_RICO"]  += Playerstats.K_RICO
	weapon_list[-1]["K_SPL"]  += Playerstats.K_SPL
	weapon_list[-1]["K_ACCURACY"]  += Playerstats.K_ACCURACY
	weapon_list[-1]["K_CRIT_RATE"]  += Playerstats.K_CRIT_RATE

func update_weapon(idx):
	weapon_list[idx]["K_LV"] += 1
	weapon_list[idx]["K_ATK"] = weapon_list[idx]["K_ATK"] * pow(2, weapon_list[idx]["K_LV"]-1) + weapon_list[idx]["K_LV"]*weapon_list[idx]["K_GROWTH"] + Playerstats.K_ADD_DMG

func remove_weapon(idx):
	weapon_list.remove_at(idx)

func init_player(role_dict):
	role_name = role_dict["role_name"]
	stage_index = role_dict["stage_index"]
	level_mode = role_dict["level_mode"]
	K_LV = role_dict["K_LV"]
	K_INFO = role_dict["K_INFO"]
	K_MAX_EXP = role_dict["K_MAX_EXP"]
	K_MAX_HP = role_dict["K_MAX_HP"]
	K_HP = role_dict["K_HP"]
	K_EXP = role_dict["K_EXP"]
	K_HP_RECOVERY_RATE = role_dict["K_HP_RECOVERY_RATE"]
	K_SPEED = role_dict["K_SPEED"]
	K_ARMOR = role_dict["K_ARMOR"]
	K_EFFICIENCY = role_dict["K_EFFICIENCY"]
	K_EVASION = role_dict["K_EVASION"]
	K_ACCURACY = role_dict["K_ACCURACY"]
	K_CRIT_RATE = role_dict["K_CRIT_RATE"]
	K_BOUNTY_GAIN = role_dict["K_BOUNTY_GAIN"]
	K_EXP_GAIN = role_dict["K_EXP_GAIN"]
	K_INFO_BOUND = role_dict["K_INFO_BOUND"]
	K_INTELLIGENCE_BOUND = role_dict["K_INTELLIGENCE_BOUND"]
	K_ELOQUENCY = role_dict["K_ELOQUENCY"]
	K_AFFINITY = role_dict["K_AFFINITY"]
	K_SANITY = role_dict["K_SANITY"]
	K_INTELLIGENCE = role_dict["K_INTELLIGENCE"]
	bounty_count = role_dict["bounty_count"]

	K_UPGRADE_COUNT = role_dict["K_UPGRADE_COUNT"]
	weapon_radius = role_dict["weapon_radius"]
	
	K_ADD_DMG = role_dict["K_ADD_DMG"]
	K_EXPL_RNG = role_dict["K_EXPL_RNG"]
	K_EXPL_DMG = role_dict["K_EXPL_DMG"]
	K_TP = role_dict["K_TP"]
	K_RICO = role_dict["K_RICO"]
	K_SPL = role_dict["K_SPL"]
	avatar = role_dict["avatar"]
	itemDict = role_dict["itemDict"].duplicate()
	hurt_audio = role_dict["hurt_audio"]
	move_audio = role_dict["move_audio"]
	pickup_audio = role_dict["pickup_audio"]
	sp_dict = role_dict["sp_dict"]
	weapon_list = []
	for i in role_dict["weapon_list"]:
		weapon_list.append(i.duplicate())

	for item_key in itemDict:
		var item_num = itemDict[item_key]
		var item = Setting.Items[item_key]
		for attr_key in item:
			if typeof(item[attr_key]) != TYPE_STRING:
				Playerstats[attr_key] += item[attr_key] * item_num

	for i in range(len(weapon_list)):
		var weapon_data = WeaponSetting.weapons_data[weapon_list[i]["K_WEAPON_NAME"]].duplicate()
		weapon_list[i].merge(weapon_data)
		weapon_list[i]["K_ATK"] = weapon_list[i]["K_ATK"] * pow(2, weapon_list[i]["K_LV"]-1) + weapon_list[i]["K_LV"]*weapon_list[i]["K_GROWTH"] + Playerstats.K_ADD_DMG
		weapon_list[i]["K_ATK_INTVL"] = weapon_data["K_ATK_INTVL"]
		weapon_list[i]["K_EXPL_RNG"] += Playerstats.K_EXPL_RNG
		weapon_list[i]["K_EXPL_DMG"] += Playerstats.K_EXPL_DMG
		weapon_list[i]["K_TP"] += Playerstats.K_TP
		weapon_list[i]["K_RICO"]  += Playerstats.K_RICO
		weapon_list[i]["K_SPL"]  += Playerstats.K_SPL
		weapon_list[i]["K_ACCURACY"]  += Playerstats.K_ACCURACY
		weapon_list[i]["K_CRIT_RATE"]  += Playerstats.K_CRIT_RATE

const Player_Attr_Dict = {
	"K_LV":{
		"text":"K_LV_DESC",
		"img":"res://asset/attr/lv.png"
	},
	"K_MAX_EXP":{
		"text":"K_MAX_EXP_DESC",
		"img":"res://asset/attr/exp.png"
	},
	"K_MAX_HP":{
		"text":"K_MAX_HP_DESC",
		"img":"res://asset/attr/hp.png",
	},
	"K_HP_RECOVERY_RATE":{
		"text":"K_HP_RECOVERY_RATE_DESC",
		"img":"res://asset/attr/hp_recovery.png",
	},
	"K_ARMOR":{
		"text":"K_ARMOR_DESC",
		"img":"res://asset/attr/armor.png",
	},
	"K_SPEED":{
		"text":"K_SPEED_DESC",
		"img":"res://asset/attr/speed.png",
	},
	"K_EVASION":{
		"text":"K_EVASION_DESC",
		"img":"res://asset/attr/evasion.png",
	},
	"K_ACCURACY":{
		"text":"K_ACCURACY_DESC",
		"img":"res://asset/attr/accuracy.png",
	},
	"K_CRIT_RATE":{
		"text":"K_CRIT_RATE_DESC",
		"img":"res://asset/attr/crit.png",
	},
	"K_BOUNTY_GAIN":{
		"text":"K_BOUNTY_GAIN_DESC",
		"img":"res://asset/attr/bounty_gain.png",
	},
	"K_EXP_GAIN":{
		"text":"K_EXP_GAIN_DESC",
		"img":"res://asset/attr/exp_gain.png",
	},
	"K_ELOQUENCY":{#口才
		"text":"K_ELOQUENCY_DESC",
		"img":"res://asset/attr/eloquency.png",
	},
	"K_AFFINITY":{#亲和力
		"text":"K_AFFINITY_DESC",
		"img":"res://asset/attr/affinity.png",
	},
	"K_SANITY":{#理智
		"text":"K_SANITY_DESC",
		"img":"res://asset/attr/sanity.png",
	},
	"K_INFO":{
		"text":"K_INFO_DESC",
		"img":"res://asset/attr/info.png"
	},
	"K_INTELLIGENCE":{
		"text":"K_INTELLIGENCE_DESC",
		"img":"res://asset/attr/intelligence.png",
	},
	"K_EFFICIENCY":{
		"text":"K_EFFICIENCY_DESC",
		"img":"res://asset/attr/efficiency.png",
	},
	"K_ADD_DMG":{
		"text":"K_ADD_DMG_DESC",
		"img":"res://asset/attr/add_dmg.png",
	},
	"K_EXPL_RNG":{
		"text":"K_EXPL_RNG_DESC",
		"img":"res://asset/attr/expl_rng.png",
	},
	"K_EXPL_DMG":{
		"text":"K_EXPL_DMG_DESC",
		"img":"res://asset/attr/expl_dmg.png",
	},
	"K_TP":{
		"text":"K_TP_DESC",
		"img":"res://asset/attr/tp.png",
	},
	"K_RICO":{
		"text":"K_RICO_DESC",
		"img":"res://asset/attr/rico.png",
	},
	"K_SPL":{
		"text":"K_SPL_DESC",
		"img":"res://asset/attr/spl.png",
	}
}


const ROLE_TEMPLATE = {
	"N_IC":{
		"role_name":"N_IC",
		"desc":"K_IC_INTRO",
		"level_mode" : 1,
		"attr_points":20,
		"stage_index" : 1,
		"K_MAX_HP" : 200,
		"K_HP" : 200,
		"K_MAX_EXP" : 100,
		"K_EXP" : 0,
		"K_ARMOR" : 0,
		"K_HP_RECOVERY_RATE" : 0,
		"K_INFO" : 0,
		"K_SPEED" : 100,
		"K_EFFICIENCY" : 0,
		"K_EVASION" : 20,
		"K_ACCURACY" : 20,
		"K_CRIT_RATE" : 20,
		"K_BOUNTY_GAIN" : 0,
		"K_EXP_GAIN" : 0,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 10,
		"K_INTELLIGENCE" : 10,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"bounty_count" : 111,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 25,
		"K_ADD_DMG": 10, 
		"K_EXPL_RNG": 0,
		"K_EXPL_DMG": 0,
		"K_TP":1,
		"K_RICO": 0,#跳弹
		"K_SPL":0,
		"avatar": "res://asset/main_character/IC/avatar.png",
		"hurt_audio":"res://asset/main_character/IC/sound/hurt.wav",
		"move_audio":"res://asset/main_character/IC/sound/Spaceship_1.wav",
		"pickup_audio":"res://asset/main_character/IC/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0}
		],
		"itemDict": {
		},
		"sp_dict":{
			"sp_cd": 10,
			"sp_auto": false,
			"sp_period":5,
			"sp_start":"bullet_speed_slow",
			"sp_end":"bullet_speed_norlmal",
		}},
	"N_AD":{
		"role_name":"N_AD",
		"desc":"K_AD_INTRO",
		"level_mode" : 1,
		"attr_points":5,
		"stage_index" : 1,
		"K_MAX_HP" : 200,
		"K_HP" : 200,
		"K_MAX_EXP" : 100,
		"K_INFO" : 100,
		"K_EXP" : 0,
		"K_HP_RECOVERY_RATE" : 0,
		"K_SPEED" : 100,
		"K_ARMOR" : 0,
		"K_EFFICIENCY" : 0,
		"K_EVASION" : 10,
		"K_ACCURACY" : 10,
		"K_CRIT_RATE" : 10,
		"K_BOUNTY_GAIN" : 0,
		"K_EXP_GAIN" : 0,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 10,
		"K_INTELLIGENCE" : 0,
		"bounty_count" : 200,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 20,
		"avatar": "res://asset/main_character/AD/avatar.png",
		"K_ADD_DMG": 0, 
		"K_EXPL_RNG": 0,
		"K_EXPL_DMG": 0,
		"K_TP":0,
		"K_RICO": 0,#跳弹
		"K_SPL":0,
		"hurt_audio":"res://asset/main_character/AD/sound/hurt.wav",
		"move_audio":"res://asset/main_character/AD/sound/Eaglet.wav",
		"pickup_audio":"res://asset/main_character/AD/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 4.0}
		],
		"itemDict": {
			"LIGHT_ORE":2
		},
		"sp_dict":{
			"sp_cd": 16,
			"sp_auto": false,
			"sp_period":4,
			"sp_start":"become_inviolable",
			"sp_end":"become_violable",
		}},
	"N_NE":{
		"role_name":"N_NE",
		"desc":"K_NE_INTRO",
		"level_mode" : 1,
		"attr_points":5,
		"stage_index" : 1,
		"K_MAX_HP" : 200,
		"K_HP" : 200,
		"K_MAX_EXP" : 100,
		"K_INFO" : 100,
		"K_EXP" : 0,
		"K_HP_RECOVERY_RATE" : 5,
		"K_SPEED" : 100,
		"K_ARMOR" : 1,
		"K_EFFICIENCY" : 20,
		"K_EVASION" : 0,
		"K_ACCURACY" : 0,
		"K_CRIT_RATE" : 0,
		"K_BOUNTY_GAIN" : 0,
		"K_EXP_GAIN" : 0,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 10,
		"K_INTELLIGENCE" : 0,
		"bounty_count" : 50,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 30,
		"avatar": "res://asset/main_character/NE/avatar.png",
		"K_ADD_DMG": 2, 
		"K_EXPL_RNG": 10,
		"K_EXPL_DMG": 3,
		"K_TP":1,
		"K_RICO": 1,#跳弹
		"K_SPL":1,
		"hurt_audio":"res://asset/main_character/NE/sound/hurt.wav",
		"move_audio":"res://asset/main_character/NE/sound/Vehicle Motor 3.wav",
		"pickup_audio":"res://asset/main_character/NE/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
		],
		"itemDict": {
		},
		"sp_dict":{
			"sp_cd": 4,
			"sp_auto": false,
			"sp_period":1,
			"sp_start":"rapid_recover",
			"sp_end":"normal_recover",
		}},
	"N_AS":{
		"role_name":"N_AS",
		"desc":"K_AS_INTRO",
		"level_mode" : 1,
		"attr_points":10,
		"stage_index" : 1,
		"K_MAX_HP" : 200,
		"K_HP" : 200,
		"K_MAX_EXP" : 100,
		"K_INFO" : 100,
		"K_EXP" : 0,
		"K_HP_RECOVERY_RATE" : 0,
		"K_SPEED" : 100,
		"K_ARMOR" : 0,
		"K_EFFICIENCY" : 0,
		"K_EVASION" : 40,
		"K_ACCURACY" : 40,
		"K_CRIT_RATE" : 0,
		"K_BOUNTY_GAIN" : 0,
		"K_EXP_GAIN" : 0,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 50,
		"K_INTELLIGENCE" : 0,
		"bounty_count" : 100,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 25,
		"avatar": "res://asset/main_character/AS/avatar.png",
		"K_ADD_DMG": 0, 
		"K_EXPL_RNG": 0,
		"K_EXPL_DMG": 0,
		"K_TP":0,
		"K_RICO": 0,#跳弹
		"K_SPL":0,
		"hurt_audio":"res://asset/main_character/AS/sound/hurt.wav",
		"move_audio":"res://asset/main_character/AS/sound/Unspeak.wav",
		"pickup_audio":"res://asset/main_character/AS/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
		],
		"itemDict": {
		},
		"sp_dict":{
			"sp_cd": 30,
			"sp_auto": false,
			"sp_period":5,
			"sp_start":"divine_revelation",
			"sp_end":"mental_injuries",
		}},
	"N_M":{
		"role_name":"N_M",
		"desc":"K_M_INTRO",
		"level_mode" : 1,
		"attr_points":5,
		"stage_index" : 1,
		"K_MAX_HP" : 200,
		"K_HP" : 200,
		"K_MAX_EXP" : 100,
		"K_EXP" : 0,
		"K_ARMOR" : 0,
		"K_HP_RECOVERY_RATE" : 0,
		"K_INFO" : 0,
		"K_SPEED" : 100,
		"K_EFFICIENCY" : 0,
		"K_EVASION" : 20,
		"K_ACCURACY" : 20,
		"K_CRIT_RATE" : 20,
		"K_BOUNTY_GAIN" : 10,
		"K_EXP_GAIN" : 0,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 10,
		"K_INTELLIGENCE" : 10,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"bounty_count" : 111,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 25,
		"K_ADD_DMG": 10, 
		"K_EXPL_RNG": 0,
		"K_EXPL_DMG": 0,
		"K_TP":1,
		"K_RICO": 0,#跳弹
		"K_SPL":0,
		"avatar": "res://asset/avatar/m.png",
		"hurt_audio":"res://asset/main_character/IC/sound/hurt.wav",
		"move_audio":"res://asset/main_character/IC/sound/Spaceship_1.wav",
		"pickup_audio":"res://asset/main_character/IC/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0}
		],
		"itemDict": {
		},
		"sp_dict":{
			"sp_cd": 10,
			"sp_auto": true,
			"sp_period":1,
			"sp_start":"cornucopia",
			"sp_end":"cornucopia",
		}},
	"N_RC":{
		"role_name":"N_RC",
		"desc":"K_RC_INTRO",
		"level_mode" : 1,
		"attr_points":5,
		"stage_index" : 1,
		"K_MAX_HP" : 200,
		"K_HP" : 200,
		"K_MAX_EXP" : 100,
		"K_EXP" : 0,
		"K_ARMOR" : 0,
		"K_HP_RECOVERY_RATE" : 0,
		"K_INFO" : 0,
		"K_SPEED" : 100,
		"K_EFFICIENCY" : 0,
		"K_EVASION" : 20,
		"K_ACCURACY" : 20,
		"K_CRIT_RATE" : 20,
		"K_BOUNTY_GAIN" : 10,
		"K_EXP_GAIN" : 0,
		"K_ELOQUENCY" : 0,
		"K_AFFINITY" : 0,
		"K_SANITY" : 10,
		"K_INTELLIGENCE" : 10,
		"K_INFO_BOUND": 100,
		"K_INTELLIGENCE_BOUND": 100,
		"bounty_count" : 111,
		"K_LV" : 1,
		"K_UPGRADE_COUNT" : 0,
		"weapon_radius" : 25,
		"K_ADD_DMG": 10, 
		"K_EXPL_RNG": 0,
		"K_EXPL_DMG": 0,
		"K_TP":1,
		"K_RICO": 0,#跳弹
		"K_SPL":0,
		"avatar": "res://asset/avatar/rc.png",
		"hurt_audio":"res://asset/main_character/IC/sound/hurt.wav",
		"move_audio":"res://asset/main_character/IC/sound/Spaceship_1.wav",
		"pickup_audio":"res://asset/main_character/IC/sound/pu.wav",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON1","K_LV": 1.0}
		],
		"itemDict": {
		},
		"sp_dict":{
			"sp_cd": 40,
			"sp_auto": true,
			"sp_period":5,
			"sp_start":"cataclysm_start",
			"sp_end":"cataclysm_end",
		}},
}
