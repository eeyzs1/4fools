extends Node

var config = ConfigFile.new()
var stage_index:int = 1
var next_stage_index:int = 1
var scenario_index:int = 0
var line_index:int = 0
var made_choices = []
var need_battle = false
var battle_field = null

var auto_interval:int = 1
var ff_interval: float = 0.1

var munually_attack = true
var dmg_display = true
var enemy_speed  = 5
var enemy_damage = 3
var enemy_spawn_period = 1
var enemy_gen_amt_et = 2
var max_enemy_amt = 20
var max_exp_growth = 1.0
var music_volume:int  = 1
var sound_volume:int  = 1
var window_mode  = 0
var resolution_x:int = 0
var resolution_y:int = 0
var market_name = "super_market"
var input_map = {
	"move_up":"W",
	"move_left":"A",
	"move_down":"S",
	"move_right":"D",
	"shoot":"mouse_1",
	"sp": "Space"
}

var locale:String:
	set(v):
		locale = v
		TranslationServer.set_locale(v)

func _ready() -> void:
	if not DirAccess.dir_exists_absolute("user://settings/"):
		DirAccess.make_dir_absolute("user://settings/")
	if FileAccess.file_exists("user://settings/common_setting.cfg"):
		var _err = config.load("user://settings/common_setting.cfg")
		for section in config.get_sections():
			if section == "Common":
				locale = config.get_value(section,"locale","en")
				munually_attack = config.get_value(section,"munually_attack",false)
				dmg_display = config.get_value(section,"dmg_display",true)
				enemy_speed = config.get_value(section,"enemy_speed",5)
				enemy_damage = config.get_value(section,"enemy_damage",3)
				enemy_spawn_period = config.get_value(section,"enemy_spawn_period",1)
				enemy_gen_amt_et = config.get_value(section,"enemy_gen_amt_et",2)
				max_enemy_amt = config.get_value(section,"max_enemy_amt",20)
				max_exp_growth = config.get_value(section,"max_exp_growth",1.0)
				music_volume = config.get_value(section,"music_volume",5)
				sound_volume = config.get_value(section,"sound_volume",5)
				window_mode = config.get_value(section,"window_mode",0)
				resolution_x = config.get_value(section,"resolution_x",1920)
				resolution_y = config.get_value(section,"resolution_y",1080)
				market_name = config.get_value(section,"market_name","super_market")
				for key in input_map:#just ensure the order of key will not out-of-order
					input_map[key] = config.get_value(section,key,input_map[key])
	else:
		locale = "en"
		munually_attack = false
		dmg_display = true
		enemy_speed = 5
		enemy_damage = 3
		enemy_spawn_period = 1
		enemy_gen_amt_et = 2
		max_enemy_amt = 20
		max_exp_growth = 1.0
		music_volume = 1
		sound_volume = 1
		window_mode = 0
		resolution_x = 1920
		resolution_y = 1080
		market_name = "super_market"
		input_map = {
			"move_up":"W",
			"move_left":"A",
			"move_down":"S",
			"move_right":"D",
			"shoot":"mouse_1",
			"sp": "Space"
		}
	# cal_prices()

func reset_config():
		locale = "en"
		munually_attack = false
		dmg_display = true
		enemy_speed = 5
		enemy_damage = 3
		enemy_spawn_period = 1
		enemy_gen_amt_et = 2
		max_enemy_amt = 20
		max_exp_growth = 1.0
		music_volume = 1
		sound_volume = 1
		window_mode = 0
		resolution_x = 1920
		resolution_y = 1080
		market_name = "super_market"
		input_map = {
			"move_up":"W",
			"move_left":"A",
			"move_down":"S",
			"move_right":"D",
			"shoot":"mouse_1",
			"sp": "Space"
		}
		save_config()

func save_config() -> void:
	config.set_value("Common","locale",locale)
	config.set_value("Common","munually_attack",munually_attack)
	config.set_value("Common","dmg_display",dmg_display)
	config.set_value("Common","enemy_speed",enemy_speed)
	config.set_value("Common","enemy_damage",enemy_damage)
	config.set_value("Common","enemy_spawn_period",enemy_spawn_period)
	config.set_value("Common","enemy_gen_amt_et",enemy_gen_amt_et)
	config.set_value("Common","max_enemy_amt",max_enemy_amt)
	config.set_value("Common","max_exp_growth",max_exp_growth)
	config.set_value("Common","music_volume",music_volume)
	config.set_value("Common","sound_volume",sound_volume)
	config.set_value("Common","window_mode",window_mode)
	config.set_value("Common","resolution_x",resolution_x)
	config.set_value("Common","resolution_y",resolution_y)
	config.set_value("Common","market_name",market_name)
	for key in input_map:#if store dict,it will store in the order of keys
		config.set_value("Common",key,input_map[key])
	config.save("user://settings/common_setting.cfg")

# func cal_prices():
	# var attr20ls = ["K_INFO","K_MAX_HP","K_ELOQUENCY","K_AFFINITY","K_SANITY","K_INTELLIGENCE"]
	# var attr300ls = ["K_ARMOR","K_TP","K_RICO","K_SPL"]
	# var attr50ls = ["K_EXPL_DMG","K_EXPL_RNG","K_ACCURACY","K_CRIT_RATE","K_EVASION"]

	# var attr100ls = ["K_HP_RECOVERY_RATE"]
	# var attr30ls = ["K_ADD_DMG","K_EFFICIENCY"]
	# var attr500ls = ["K_BOUNTY_GAIN","K_EXP_GAIN"]
	# var priceval = 0
	# for i in Items:
	# 	if i != "bounty":
	# 		priceval = 0
	# 		for j in attr30ls:
	# 			if Items[i].has(j):
	# 				priceval = priceval + 30 * Items[i][j]
	# 		for j in attr20ls:
	# 			if Items[i].has(j):
	# 				priceval = priceval + 20 * Items[i][j]
	# 		for j in attr300ls:
	# 			if Items[i].has(j):
	# 				priceval = priceval + 300 * Items[i][j] 
	# 		for j in attr50ls:
	# 			if Items[i].has(j):
	# 				priceval = priceval + 50 * Items[i][j]
	# 		for j in attr100ls:
	# 			if Items[i].has(j):
	# 				priceval = priceval + 100 * Items[i][j]
	# 		for j in attr500ls:
	# 			if Items[i].has(j):
	# 				priceval = priceval + 500 * Items[i][j]
	#		if  Items[i].has("K_SPEED"):
	# 				priceval = priceval + 50 * Items[i]["K_SPEED"]
	# 		print("\""+i+"\""+":"+str(priceval)+",")

#+-15%,bounty20 = attr1,atk attr = 300/pt,exp 50,
#crit,acc,eva,armor = 100/pts,K_ADD_DMG = 10,speed=10
const market_dict = {
	"super_market":{
			"bg_image": "res://asset/market/sp.png",
			"bg_music": "res://asset/market/romance.ogg",
			"salesperson": "res://asset/market/F_04.PNG",
			"patience":100,
			"item_list": [
["LIGHT_ORE",360],["HEAVY_ORE",840],["SFC",390],["VL_STONE",1700],["CS_ORE",2600],["ISDI",2700],["IBD",1150],
["QT_CC",700],["LMM",900],["SS_ORE",300],["IF_ORE",1090],["PC_ORE",700],["ISIS",650],["VFC",1250],["VS_JADE",750],
["SC_LAPIS",2000],["ATM_ORE",1000],["PR_IRON",1200],["BH_SD",450],["STRT",1980],["SF_IRON",950],["DCC",1220],
["SRS_ORE",450],["ITS_AMB",1600],["SHADOW_ORE",900],["SDC",450],["SL_STONE",360],["ECT_OB",1100],["SOLID_CO",4860],
["SYN_ORE",630],["DC",10],["EC",360],["FC",150],["IC",540],["LC",60],["TC",250],["WTC",520],["WDC",60],

["ANT_SCROLL",200],["ANT_TAB",1100],["ANT_RUNE",150],["GENE_DRUG",2400],["ANT_BOOK",500],["MEM_CRYSTAL",3400],
["ALT_TOE",40],["ALT_TOOTH",40],["ALT_HEAD",80],["DIARY",900],["LOG",1000],["EXP_DEV",280],

["AME",850],["BIE",70],["BHE",3500],["CHE",600],["DE",1500],
["FISE",110],["FUSE",200],["QTE",1150],["PME",30],["FVE",32000],

["MDB",300],["BKB",100],["SPJ",260],["TPH",600],["AMV",400],["NIB",400],["SIB",600],["ETTB",233],
["FPCB",110],["BMB",200],["BCB",250],["BSB",120],["ETB",550],["BDB",300],["MTB",270],["RTB",270],["PGTB",550],
["RSB",300],["RDB",900],["HVSL",1000],["SCSL",1000],["SBSL",60],["WMSL",120],["STSL",260],["FYSL",400],
["SSSL",840],["EGSL",700],["ODSL",250],["FFSL",250],["MTBG",600],["CPHK",1500],["ALPU",200],["BTAZ",1500],
["STAM",600],["FBAM",100],["EMEM",40],["ASSS",400],["BNRR",60],["SVCT",200],["EQCP",300],["EPEE",100],
["DLST",160],["ASAC",1000],["MPAZ",80],["SGTD",40],["EGR",770],["SPBT",1100],["STBT",300],["LBB",1020],
["CTPS",1000],["BKE",300],["PTBT",450],["HEBT",1070],["CDBT",850],["ETPP",150],["TG",60],["ECB",90],["EPF",200],
["VPBP",1000],["ASOW",40],["OBEE",650],["LDB",250],["MMA",300],["WKOB",250],
["ATRP",200],["TLP",100],["MDEH",820],["LBT",510],
["WEAPON1",6600],["WEAPON2",2260],["WEAPON3",2000],["WEAPON4",3033],["WEAPON5",1740],
["WEAPON6",4600],["WEAPON7",1988],["WEAPON8",8640],["WEAPON9",275],["WEAPON10",3400],["WEAPON11",6200],
["WEAPON12",125],["WEAPON13",230],["WEAPON14",5900],["WEAPON15",2450],["WEAPON16",2275],
["WEAPON17",1389],["WEAPON18",1700],["WEAPON19",7750],["WEAPON20",1125],
["WEAPON21",950],["WEAPON22",6016],["WEAPON23",3183],["WEAPON24",625],
["WEAPON25",1444],["WEAPON26",800],["WEAPON27",720],["WEAPON28",3920],["WEAPON29",1925],
["WEAPON30",200],["WEAPON31",350],["WEAPON32",5475],["WEAPON33",150]
]},
	"charm_market1":{
			"bg_image": "res://asset/market/sp.png",
			"bg_music": "res://asset/market/romance.ogg",
			"salesperson": "res://asset/market/F_04.PNG",
			"patience":100,
			"item_list": [
	["MEM_CRYSTAL",1700],["GENE_DRUG",1200],["RSB",150],["ASSS",200],
	["EQCP",150],["EPF",100],["VPBP",500],["ASOW",20],["TLP",50],
	["MPAZ",40],["EMEM",20],["RSB",150],["DIARY",450],["LOG",500]]
		},
	"imperial_market1":{#todo
		"bg_image": "res://asset/market/ip1.png",
		"bg_music": "res://asset/market/nectar.ogg",
		"salesperson": "res://asset/market/F_05.PNG",
		"patience":120,
		"item_list": [#25+4
	["LIGHT_ORE",360],["HEAVY_ORE",840],["LMM",900],["BH_SD",450],["ALT_TOE",40],["ALT_TOOTH",40],
	["ALT_HEAD",80],["EXP_DEV",280],["BIE",70],["MDB",300],["BKB",100],["BCB",250],
	["BSB",120],["STSL",260],["FYSL",400],["ODSL",250],["ALPU",200],["STAM",600],["BNRR",60],
	["EPEE",100],["DLST",160],["BKE",300],["ETPP",150],["ECB",90],["EPF",200],
	["WEAPON30",200],["WEAPON31",350],["WEAPON33",150],["WEAPON24",625],
	]},
	"imperial_market2":{#todo
		"bg_image": "res://asset/market/ip2.png",
		"bg_music": "res://asset/market/airship.ogg",
		"salesperson": "res://asset/market/F_02.PNG",
		"patience":160,
		"item_list": [#33+7
	["LIGHT_ORE",360],["HEAVY_ORE",840],["QT_CC",700],["LMM",900],["PR_IRON",1200],["SYN_ORE",630],
	["BH_SD",450],["VS_JADE",750],["ALT_TOE",40],["ALT_TOOTH",40],["ALT_HEAD",80],["EXP_DEV",280],
	["BIE",70],["CHE",600],["MDB",300],["BKB",100],["BCB",250],["BSB",120],["ETB",550],["STSL",260],
	["FYSL",400],["ODSL",250],["MTBG",600],["ALPU",200],["STAM",600],["BNRR",60],["EPEE",100],
	["DLST",160],["EGR",770],["BKE",300],["ETPP",150],["ECB",90],["EPF",200],
	["WEAPON30",200],["WEAPON31",350],["WEAPON33",150],["WEAPON24",625],
	["WEAPON6",4600],["WEAPON21",950],["WEAPON18",1700],
	]
	},
	"imperial_market3":{#todo
		"bg_image": "res://asset/market/ip3.png",
		"bg_music": "res://asset/market/Knight In A Tavern.ogg",
		"salesperson": "res://asset/market/F_01.PNG",
		"patience":200,
		"item_list": [#44+10
	["LIGHT_ORE",360],["HEAVY_ORE",840],["QT_CC",700],["LMM",900],["PR_IRON",1200],["ATM_ORE",1000],
	["DCC",1220],["SYN_ORE",630],["SC_LAPIS",2000],["BH_SD",450],["VS_JADE",750],["GENE_DRUG",2400],
	["ALT_TOE",40],["ALT_TOOTH",40],["ALT_HEAD",80],["LOG",1000],["EXP_DEV",280],["QTE",1150],
	["BIE",70],["CHE",600],["MDB",300],["BKB",100],["BCB",250],["BSB",120],["ETB",550],["STSL",260],
	["FYSL",400],["ODSL",250],["MTBG",600],["CPHK",1500],["ALPU",200],["BTAZ",1500],["STAM",600],
	["BNRR",60],["EPEE",100],["DLST",160],["ASAC",1000],["EGR",770],["SPBT",1100],
	["BKE",300],["ETPP",150],["ECB",90],["EPF",200],["BHE",3500],
	["WEAPON30",200],["WEAPON31",350],["WEAPON1",6600],["WEAPON33",150],["WEAPON24",625],
	["WEAPON29",1925],["WEAPON16",2275],["WEAPON6",4600],["WEAPON21",950],["WEAPON18",1700],
	]},
	"alliance_market1":{#todo
		"bg_image": "res://asset/market/al1.png",
		"bg_music": "res://asset/market/Hall of Salvation.ogg",
		"salesperson": "res://asset/market/F_09.PNG",
		"patience":100,
		"item_list": [#24+4
	["PC_ORE",700],["SRS_ORE",450],["SHADOW_ORE",900],["DC",10],["EC",360],["FC",150],
	["LC",60],["TC",250],["WTC",520],["WDC",60],["FISE",110],["FUSE",200],["SPJ",260],
	["ETTB",233],["RSB",300],["FPCB",110],["BMB",200],["BDB",300],["MTB",270],
	["WMSL",120],["FBAM",100],["EMEM",40],["SVCT",200],["MPAZ",80],
	["WEAPON7",1988],["WEAPON10",3400],["WEAPON27",720],["WEAPON17",1389],
	]},
	"alliance_market2":{#todo
		"bg_image": "res://asset/market/al2.png",
		"bg_music": "res://asset/market/A Glimmer of Hope.ogg",
		"salesperson": "res://asset/market/F_08.PNG",
		"patience":120,
		"item_list": [#33+7
	["CS_ORE",2600],["IF_ORE",1090],["PC_ORE",700],["SRS_ORE",450],["SHADOW_ORE",900],["SL_STONE",360],
	["DC",10],["EC",360],["FC",150],["IC",540],["LC",60],["TC",250],["WTC",520],["WDC",60],
	["FISE",110],["FUSE",200],["SPJ",260],["TPH",600],["SIB",600],["ETTB",233],["PGTB",550],
	["RSB",300],["FPCB",110],["BMB",200],["BDB",300],["MTB",270],["WMSL",120],["SSSL",840],
	["FBAM",100],["EMEM",40],["SVCT",200],["MPAZ",80],["PTBT",450],
	["WEAPON5",1740],["WEAPON7",1988],["WEAPON10",3400],["WEAPON11",6200],
	["WEAPON27",720],["WEAPON17",1389],["WEAPON28",3920],
	]},
	"alliance_market3":{#todo
		"bg_image": "res://asset/market/al3.png",
		"bg_music": "res://asset/market/Drunken King.ogg",
		"salesperson": "res://asset/market/F_06.PNG",
		"patience":150,
		"item_list": [#43+11
	["VL_STONE",1700],["CS_ORE",2600],["IBD",1150],["IF_ORE",1090],["PC_ORE",700],["VFC",1250],
	["STRT",1980],["SRS_ORE",450],["SHADOW_ORE",900],["SL_STONE",360],["SOLID_CO",4860],["HEBT",1070],
	["DC",10],["EC",360],["FC",150],["IC",540],["LC",60],["TC",250],["WTC",520],["WDC",60],
	["FISE",110],["FUSE",200],["DE",1500],["AME",850],["SPJ",260],["TPH",600],["SIB",600],
	["ETTB",233],["PGTB",550],["RDB",900],["RSB",300],["FPCB",110],["BMB",200],["BDB",300],["MTB",270],
	["WMSL",120],["SSSL",840],["EGSL",700],["FBAM",100],["EMEM",40],["SVCT",200],["MPAZ",80],["PTBT",450],
	["WEAPON2",2260],["WEAPON4",3033],["WEAPON5",1740],["WEAPON7",1988],["WEAPON10",3400],["WEAPON11",6200],
	["WEAPON28",3920],["WEAPON27",720],["WEAPON32",5475],["WEAPON17",1389],["WEAPON19",7750],
	]},
	"neutral_market1":{
			"bg_image": "res://asset/market/ne1.png",
			"bg_music": "res://asset/market/Little Shop.ogg",
			"salesperson": "res://asset/market/F_03.PNG",
			"patience":80,
			"item_list": [#20+4
	["SFC",390],["ANT_SCROLL",200],["ANT_RUNE",150],["PME",30],["AMV",400],["NIB",400],["SBSL",60],
	["RTB",270],["FFSL",250],["ASSS",400],["EQCP",300],["SGTD",40],["ASOW",40],["STBT",300],
	["LDB",250],["MMA",300],["WKOB",250],["TLP",100],["TG",60],["ATRP",200],
	["WEAPON13",230],["WEAPON9",275],["WEAPON12",125],["WEAPON26",800],
	]},
	"neutral_market2":{
			"bg_image": "res://asset/market/ne2.png",
			"bg_music": "res://asset/market/Rush through the Pagodas.ogg",
			"salesperson": "res://asset/market/F_07.PNG",
			"patience":80,
			"item_list": [#30+8
	["SFC",390],["ANT_SCROLL",200],["ANT_RUNE",150],["PME",30],["AMV",400],["NIB",400],["SBSL",60],
	["RTB",270],["FFSL",250],["ASSS",400],["EQCP",300],["SGTD",40],["ASOW",40],["STBT",300],
	["LDB",250],["MMA",300],["WKOB",250],["TLP",100],["TG",60],["ATRP",200],
	["ISDI",2700],["SS_ORE",300],["ISIS",650],["SDC",450],["ANT_BOOK",500],
	["DIARY",900],["CDBT",850],["OBEE",650],["LBT",510],["MDEH",820],
	["WEAPON13",230],["WEAPON3",2000],["WEAPON9",275],["WEAPON12",125],
	["WEAPON8",8640],["WEAPON20",1125],["WEAPON25",1444],["WEAPON26",800],
	]},
	"neutral_market3":{
			"bg_image": "res://asset/market/ne3.png",
			"bg_music": "res://asset/market/Honobono Teahouse.ogg",
			"salesperson": "res://asset/market/F_10.PNG",
			"patience":80,
			"item_list": [#40+12
	["SFC",390],["ISDI",2700],["SS_ORE",300],["ISIS",650],["ITS_AMB",1600],["SDC",450],["ECT_OB",1100],
	["ANT_SCROLL",200],["ANT_TAB",1100],["ANT_RUNE",150],["ANT_BOOK",500],["MEM_CRYSTAL",3400],["DIARY",900],
	["PME",30],["FVE",32000],["AMV",400],["NIB",400],["HVSL",1000],["SCSL",1000],["SBSL",60],["RTB",270],
	["FFSL",250],["ASSS",400],["EQCP",300],["SGTD",40],["LBB",1020],["CTPS",1000],["CDBT",850],["ASOW",40],
	["STBT",300],["OBEE",650],["LDB",250],["MMA",300],["WKOB",250],["TLP",100],["LBT",510],
	["TG",60],["VPBP",1000],["ATRP",200],["MDEH",820],
	["WEAPON13",230],["WEAPON3",2000],["WEAPON9",275],["WEAPON12",125],["WEAPON14",5900],["WEAPON15",2450],
	["WEAPON8",8640],["WEAPON20",1125],["WEAPON22",6016],["WEAPON23",3183],["WEAPON25",1444],["WEAPON26",800],
	]},
}

const MAKRET_BGI = [
	"res://asset/market/sp.png",
	"res://asset/market/ip1.png",
	"res://asset/market/ip2.png",
	"res://asset/market/ip3.png",
	"res://asset/market/al1.png",
	"res://asset/market/al2.png",
	"res://asset/market/al3.png",
	"res://asset/market/ne1.png",
	"res://asset/market/ne2.png",
	"res://asset/market/ne3.png"
]
const MAKRET_BGM = [
	"res://asset/market/romance.ogg",
	"res://asset/market/nectar.ogg",
	"res://asset/market/airship.ogg",
	"res://asset/market/Knight In A Tavern.ogg",
	"res://asset/market/Hall of Salvation.ogg",
	"res://asset/market/A Glimmer of Hope.ogg",
	"res://asset/market/Drunken King.ogg",
	"res://asset/market/Little Shop.ogg",
	"res://asset/market/Rush through the Pagodas.ogg",
	"res://asset/market/Honobono Teahouse.ogg"
]
const MAKRET_SP = [
	"res://asset/market/F_01.PNG",
	"res://asset/market/F_02.PNG",
	"res://asset/market/F_03.PNG",
	"res://asset/market/F_04.PNG",
	"res://asset/market/F_05.PNG",
	"res://asset/market/F_06.PNG",
	"res://asset/market/F_07.PNG",
	"res://asset/market/F_08.PNG",
	"res://asset/market/F_09.PNG",
	"res://asset/market/F_10.PNG"
]

const Items = {
	"bounty":{"K_IMG":"res://items/asset/bounty.png"},
	"LIGHT_ORE":{"K_IMG":"res://items/asset/ores/LightOre.png","K_ARMOR": 1,"K_SPEED": 2},
	"HEAVY_ORE":{"K_IMG":"res://items/asset/ores/HeavyOre.png","K_ARMOR": 3,"K_SPEED": -2},
	"SFC":{"K_IMG":"res://items/asset/ores/StarfallCrystal.png","K_ARMOR": 1,"K_SPEED": -2,"K_ADD_DMG":5},
	"VL_STONE":{"K_IMG":"res://items/asset/ores/VoidLuminescentStone.png","K_ARMOR": 3,"K_SPEED": 10,"K_EVASION":10},
	"CS_ORE":{"K_IMG":"res://items/asset/ores/ChronoSecretOre.png","K_ARMOR": 10,"K_SPEED": 20,"K_CRIT_RATE":-20},
	"ISDI":{"K_IMG":"res://items/asset/ores/InterstellarDarkIron.png","K_ARMOR": 10,"K_SPEED": -20,"K_TP":1},
	"IBD":{"K_IMG":"res://items/asset/ores/IllusionaryBlueDiamond.png","K_EVASION": 25,"K_MAX_HP":10,"K_ADD_DMG":-10},
	"QT_CC":{"K_IMG":"res://items/asset/ores/QuantumCrystalCluster.png","K_ARMOR": -1,"K_SPL":2,"K_HP_RECOVERY_RATE":4},
	"LMM":{"K_IMG":"res://items/asset/ores/LatentMatterMine.png","K_ARMOR": 3,"K_EVASION":10,"K_HP_RECOVERY_RATE":-5},
	"SS_ORE":{"K_IMG":"res://items/asset/ores/SpiritualOre.png","K_ARMOR": -1,"K_SPEED": 10,"K_ADD_DMG":10},
	"IF_ORE":{"K_IMG":"res://items/asset/ores/IronfireOre.png","K_ARMOR": 3,"K_ADD_DMG":3,"K_EXPL_DMG": 1,"K_EXPL_RNG": 1},
	"PC_ORE":{"K_IMG":"res://items/asset/ores/PrimitiveCrystalOre.png","K_SPL":1,"K_ARMOR": 1,"K_MAX_HP":5},
	"ISIS":{"K_IMG":"res://items/asset/ores/InterstellarInfernoStone.png","K_EXPL_DMG": 10,"K_EXPL_RNG": 3},
	"VFC":{"K_IMG":"res://items/asset/ores/VoidFlameCrystal.png","K_EXPL_DMG": 20,"K_EXPL_RNG": 5},
	"SC_LAPIS":{"K_IMG":"res://items/asset/ores/StarCoreLapis.png","K_ARMOR": 5,"K_EVASION": 10},
	"ATM_ORE":{"K_IMG":"res://items/asset/ores/AntimatterOre.png","K_ARMOR": -2,"K_HP_RECOVERY_RATE":-3,"K_EXPL_DMG": 30,"K_EXPL_RNG": 8},
	"PR_IRON":{"K_IMG":"res://items/asset/ores/PhotonRefinedIron.png","K_ARMOR": 3,"K_EVASION": 3,"K_ACCURACY":3},
	"BH_SD":{"K_IMG":"res://items/asset/ores/BlackHoleStardust.png","K_MAX_HP": -5,"K_ARMOR": 2,"K_EVASION":5,"K_HP_RECOVERY_RATE":-3},
	"STRT":{"K_IMG":"res://items/asset/ores/SpacetimeRiftStone.png","K_ARMOR": 5,"K_SPEED": -4,"K_HP_RECOVERY_RATE":6},
	"SF_IRON":{"K_IMG":"res://items/asset/ores/StarFantasyIron.png","K_ARMOR": 4,"K_EVASION":5,"K_CRIT_RATE":-10},
	"DCC":{"K_IMG":"res://items/asset/ores/DimensionalCrystalCore.png","K_SPL": 3,"K_MAX_HP": 16},
	"VS_JADE":{"K_IMG":"res://items/asset/ores/VoidSpiritualJade.png","K_EVASION": 5,"K_MAX_HP": 10,"K_RICO":1},
	"SRS_ORE":{"K_IMG":"res://items/asset/ores/StarrealmSilverOre.png","K_ARMOR": 1,"K_SPEED": 2,"K_ADD_DMG":3},
	"ITS_AMB":{"K_IMG":"res://items/asset/ores/InterstellarAmber.png","K_ARMOR": 3,"K_MAX_HP": 20,"K_RICO":1},
	"SHADOW_ORE":{"K_IMG":"res://items/asset/ores/ShadowOre.png","K_EVASION": 10,"K_ARMOR":2},
	"SDC":{"K_IMG":"res://items/asset/ores/StarDivineCrystal.png","K_EFFICIENCY": -10,"K_SPL": 3,"K_EVASION":-5},
	"SL_STONE":{"K_IMG":"res://items/asset/ores/StreamingLightStone.png","K_TP": 1,"K_SPEED": 2},
	"ECT_OB":{"K_IMG":"res://items/asset/ores/EnchantedObsidian.png","K_ARMOR": -2,"K_EVASION":-20,"K_CRIT_RATE":30,"K_ADD_DMG": 20,"K_RICO":2},
	"SOLID_CO":{"K_IMG":"res://items/asset/ores/SolidCrystalOre.png","K_ARMOR": 15,"K_SPEED": -8,"K_TP":20},
	"SYN_ORE":{"K_IMG":"res://items/asset/ores/SyntheticOre.png","K_ARMOR": 1,"K_SPEED": 1,"K_MAX_HP":10,"K_HP_RECOVERY_RATE":1},
	"DC":{"K_IMG":"res://items/asset/ores/DarknessCrystal.png","K_EVASION": 2,"K_SPEED": 2,"K_CRIT_RATE":-3},
	"EC":{"K_IMG":"res://items/asset/ores/EarthCrystal.png","K_ARMOR": 1,"K_MAX_HP":1,"K_HP_RECOVERY_RATE": 1,"K_SPEED": -2},
	"FC":{"K_IMG":"res://items/asset/ores/FireCrystal.png","K_EXPL_DMG": 2,"K_EXPL_RNG": 1},
	"IC":{"K_IMG":"res://items/asset/ores/IceCrystal.png","K_ARMOR": 1,"K_SPEED": -2,"K_SPL":1},
	"LC":{"K_IMG":"res://items/asset/ores/LightCrystal.png","K_ACCURACY": 2,"K_ADD_DMG": 2,"K_EVASION":-2},
	"TC":{"K_IMG":"res://items/asset/ores/ThunderCrystal.png","K_SPEED": 3,"K_CRIT_RATE": 4,"K_MAX_HP":-2},
	"WTC":{"K_IMG":"res://items/asset/ores/WaterCrystal.png","K_HP_RECOVERY_RATE": 2,"K_MAX_HP": 1,"K_ARMOR":1},
	"WDC":{"K_IMG":"res://items/asset/ores/WindCrystal.png","K_ACCURACY": -3,"K_SPEED": 7},

	"ANT_SCROLL":{"K_IMG":"res://items/asset/clue/AncientScroll.png","K_INFO": 10,"K_INTELLIGENCE":10,"K_SANITY": -10},
	"ANT_TAB":{"K_IMG":"res://items/asset/clue/AncientTablet.png","K_INFO": 35,"K_SANITY": 20},
	"ANT_RUNE":{"K_IMG":"res://items/asset/clue/AncientRunes.png","K_INFO": 5,"K_SANITY": -5,"K_ADD_DMG":5},
	"GENE_DRUG":{"K_IMG":"res://items/asset/clue/GeneDrugs.png","K_INFO": 15,"K_SANITY": -20,"K_ACCURACY":20,"K_CRIT_RATE":20,"K_ADD_DMG":10,"K_AFFINITY":10},
	"ANT_BOOK":{"K_IMG":"res://items/asset/clue/AncientBook.png","K_INFO": 10,"K_SANITY": 10,"K_INTELLIGENCE":5},
	"MEM_CRYSTAL":{"K_IMG":"res://items/asset/clue/MemoryCrystallization.png","K_INFO": 100,"K_SANITY": -50,"K_AFFINITY":20,"K_INTELLIGENCE":100},
	"ALT_TOE":{"K_IMG":"res://items/asset/clue/AlienatedToe.png","K_INFO": 3,"K_SANITY": -1},
	"ALT_TOOTH":{"K_IMG":"res://items/asset/clue/AlienatedTooth.png","K_INFO": 3,"K_SANITY": -1},
	"ALT_HEAD":{"K_IMG":"res://items/asset/clue/AlienatedHead.png","K_INFO": 6,"K_SANITY": -2},
	"DIARY":{"K_IMG":"res://items/asset/clue/Diary.png","K_INFO": 20,"K_INTELLIGENCE":20,"K_ELOQUENCY":5},
	"LOG":{"K_IMG":"res://items/asset/clue/ExpLog.png","K_INFO": 30,"K_SANITY": -10,"K_INTELLIGENCE":20,"K_ELOQUENCY":10},
	"EXP_DEV":{"K_IMG":"res://items/asset/clue/ExpDevice.png","K_INFO": 15,"K_SANITY": -1},

	"AME":{"K_IMG":"res://items/asset/energy/Antimatter.png","K_EFFICIENCY": 25,"K_SPEED": 20,"K_MAX_HP":-10,"K_ARMOR":-1},
	"BIE":{"K_IMG":"res://items/asset/energy/Bioenergy.png","K_EFFICIENCY": 2,"K_SPEED": -3,"K_MAX_HP":5},
	"BHE":{"K_IMG":"res://items/asset/energy/BlackHole.png","K_EFFICIENCY": 20,"K_ARMOR":10,"K_EVASION":10,"K_SPEED": -15,"K_ADD_DMG":-5},
	"CHE":{"K_IMG":"res://items/asset/energy/Chaos.png","K_EFFICIENCY": 30,"K_ARMOR":-4,"K_CRIT_RATE":20,"K_ADD_DMG":5,"K_ACCURACY":-5},
	"DE":{"K_IMG":"res://items/asset/energy/Latentmatter.png","K_EFFICIENCY": 15,"K_EVASION":15,"K_SPEED": 10},
	"FISE":{"K_IMG":"res://items/asset/energy/Fission.png","K_EFFICIENCY": 5,"K_MAX_HP":-2},
	"FUSE":{"K_IMG":"res://items/asset/energy/Fusion.png","K_EFFICIENCY": 10,"K_MAX_HP":-5},
	"QTE":{"K_IMG":"res://items/asset/energy/Quantum.png","K_EFFICIENCY": 15,"K_MAX_HP":20,"K_SPEED": 10},
	"PME":{"K_IMG":"res://items/asset/energy/Primary.png","K_EFFICIENCY": 1},
	"FVE":{"K_IMG":"res://items/asset/energy/Forever.png","K_EFFICIENCY": 1000,"K_MAX_HP":100},

	"MDB":{"K_IMG":"res://items/asset/info/MatrixDecodingBox.png","K_INFO": 15},
	"BKB":{"K_IMG":"res://items/asset/info/BlackBox.png","K_INFO": 5},
	"SPJ":{"K_IMG":"res://items/asset/info/SecretProtectionJar.png","K_INFO": 15,"K_SANITY": -2},
	"TPH":{"K_IMG":"res://items/asset/info/TemporalHoard.png","K_INFO": 20,"K_INTELLIGENCE":10},
	"AMV":{"K_IMG":"res://items/asset/info/AlienMysteryVessel.png","K_INFO": 25,"K_SANITY": -5},
	"NIB":{"K_IMG":"res://items/asset/info/NeutralInfoBox.png","K_INFO": 20},
	"SIB":{"K_IMG":"res://items/asset/info/SpyIntelligenceBox.png","K_INFO": 30},

	"ETTB":{"K_IMG":"res://items/asset/knowledge/EnlightenmentBook.png","K_LV": 1},
	"FPCB":{"K_IMG":"res://items/asset/knowledge/FirepowerControlBook.png","K_ACCURACY": 1,"K_ADD_DMG": 2},
	"BMB":{"K_IMG":"res://items/asset/knowledge/BattleMobilityBook.png","K_EVASION": 1,"K_SPEED": 5},
	"BCB":{"K_IMG":"res://items/asset/knowledge/BattleConcealmentBook.png","K_EVASION": 5},
	"BSB":{"K_IMG":"res://items/asset/knowledge/BattleStrikeBook.png","K_ADD_DMG": 1,"K_SPEED": 3},
	"ETB":{"K_IMG":"res://items/asset/knowledge/ExplosionTheoryBook.png","K_EXPL_RNG": 1,"K_EXPL_DMG": 10},
	"BDB":{"K_IMG":"res://items/asset/knowledge/BattleDefenseBook.png","K_ARMOR": 1},
	"MTB":{"K_IMG":"res://items/asset/knowledge/MIRVTechBook.png","K_SPL": 1,"K_ADD_DMG": -1},
	"RTB":{"K_IMG":"res://items/asset/knowledge/RicochetTechBook.png","K_RICO": 1,"K_ADD_DMG": -1},
	"PGTB":{"K_IMG":"res://items/asset/knowledge/PrecisionGuidedTechBook.png","K_ACCURACY": 5,"K_TP": 1},

	"RSB":{"K_IMG":"res://items/asset/knowledge/ReligiousSuccessesBook.png","K_ELOQUENCY": 5,"K_AFFINITY": 30,"K_SANITY":-10,"K_INTELLIGENCE":-10},
	"RDB":{"K_IMG":"res://items/asset/knowledge/ReligiousDeceptionsBook.png","K_SANITY":15,"K_INTELLIGENCE":30},
	"HVSL":{"K_IMG":"res://items/asset/knowledge/HarvestScroll.png","K_BOUNTY_GAIN":2},
	"SCSL":{"K_IMG":"res://items/asset/knowledge/SagacityScroll.png","K_EXP_GAIN":2},
	"SBSL":{"K_IMG":"res://items/asset/knowledge/SobrietyScroll.png","K_SANITY":3},
	"WMSL":{"K_IMG":"res://items/asset/knowledge/WisdomScroll.png","K_INTELLIGENCE":6},
	"STSL":{"K_IMG":"res://items/asset/knowledge/SescretScroll.png","K_SANITY":-1,"K_INTELLIGENCE":4,"K_INFO":10},
	"FYSL":{"K_IMG":"res://items/asset/knowledge/FuryScroll.png","K_SANITY":-5,"K_INTELLIGENCE":-5,"K_ACCURACY": -5,"K_ARMOR": -1,"K_CRIT_RATE":5,"K_ADD_DMG":30},
	"SSSL":{"K_IMG":"res://items/asset/knowledge/StaticStagnationScroll.png","K_SANITY":2,"K_HP_RECOVERY_RATE": 2,"K_ARMOR": 2},
	"EGSL":{"K_IMG":"res://items/asset/knowledge/EvergreenScroll.png","K_MAX_HP":10,"K_HP_RECOVERY_RATE": 5},
	"ODSL":{"K_IMG":"res://items/asset/knowledge/OverloadScroll.png","K_SPEED":5,"K_ADD_DMG": 5,"K_CRIT_RATE":5,"K_EFFICIENCY":-10},
	"FFSL":{"K_IMG":"res://items/asset/knowledge/FlightFeatherScroll.png","K_SPEED":5,"K_EVASION": 5,"K_EFFICIENCY":-5},

	"MTBG":{"K_IMG":"res://items/asset/attr/MaintenanceBag.png","K_HP_RECOVERY_RATE":6},
	"CPHK":{"K_IMG":"res://items/asset/attr/CaptureHook.png","K_BOUNTY_GAIN":3},
	"ALPU":{"K_IMG":"res://items/asset/attr/AuxiliaryProcessor.png","K_INTELLIGENCE":10},
	"BTAZ":{"K_IMG":"res://items/asset/attr/BattleAnalyzer.png","K_EXP_GAIN":3},
	"STAM":{"K_IMG":"res://items/asset/attr/StrengthenArmor.png","K_ARMOR":2},
	"FBAM":{"K_IMG":"res://items/asset/attr/FlexibleArmor.png","K_EVASION":2},
	"EMEM":{"K_IMG":"res://items/asset/attr/ExtraMemory.png","K_ELOQUENCY":2},
	"ASSS":{"K_IMG":"res://items/asset/attr/AtmosphereSensor.png","K_AFFINITY":20},
	"BNRR":{"K_IMG":"res://items/asset/attr/BrainRadiator.png","K_SANITY":3},
	"SVCT":{"K_IMG":"res://items/asset/attr/SurvivalConduct.png","K_HP_RECOVERY_RATE":2},
	"EQCP":{"K_IMG":"res://items/asset/attr/EQChip.png","K_AFFINITY":15},
	"EPEE":{"K_IMG":"res://items/asset/attr/ElectronicProstheticEye.png","K_ACCURACY":2},
	"DLST":{"K_IMG":"res://items/asset/attr/DoubleLayerStructure.png","K_MAX_HP":8},
	"ASAC":{"K_IMG":"res://items/asset/attr/AnalysisAccelerator.png","K_EXP_GAIN":2},
	"MPAZ":{"K_IMG":"res://items/asset/attr/MultipleAnalyzer.png","K_ELOQUENCY":2,"K_INTELLIGENCE":2},
	"SGTD":{"K_IMG":"res://items/asset/attr/SingleThread.png","K_SANITY":2},

	"EGR":{"K_IMG":"res://items/asset/attr/EnergyGatheringRing.png","K_TP":1,"K_ADD_DMG":5,"K_CRIT_RATE":10,"K_EFFICIENCY":-6},
	"SPBT":{"K_IMG":"res://items/asset/attr/SplitBullet.png","K_SPL":3,"K_CRIT_RATE":10,"K_ADD_DMG":-10},
	"STBT":{"K_IMG":"res://items/asset/attr/ShuttleBullet.png","K_TP":1,"K_ACCURACY":10,"K_EXPL_RNG":-10},
	"LBB":{"K_IMG":"res://items/asset/attr/LampBulb.png","K_ACCURACY":2,"K_BOUNTY_GAIN":2,"K_AFFINITY":-4},
	"CTPS":{"K_IMG":"res://items/asset/attr/CuttingPliers.png","K_BOUNTY_GAIN":2},
	"BKE":{"K_IMG":"res://items/asset/attr/BackupEnergy.png","K_EFFICIENCY":10},
	"PTBT":{"K_IMG":"res://items/asset/attr/PenetratingBullet.png","K_TP":2,"K_ADD_DMG":-5},
	"HEBT":{"K_IMG":"res://items/asset/attr/High-energyBullet.png","K_EXPL_DMG":15,"K_EXPL_RNG":10,"K_EFFICIENCY":-6},
	"CDBT":{"K_IMG":"res://items/asset/attr/ConstrainedBullet.png","K_SPL":2,"K_TP":1,"K_EXPL_DMG":5,"K_EFFICIENCY":-10},
	"ETPP":{"K_IMG":"res://items/asset/attr/EnergyTransmissionPipeline.png","K_EFFICIENCY":5},
	"TG":{"K_IMG":"res://items/asset/attr/TransmissionGear.png","K_EFFICIENCY":2},
	"ECB":{"K_IMG":"res://items/asset/attr/EnergyCable.png","K_EFFICIENCY":3},
	"EPF":{"K_IMG":"res://items/asset/attr/ElectronicPerfume.png","K_AFFINITY":10},
	"VPBP":{"K_IMG":"res://items/asset/attr/VIPBreastpiece.png","K_AFFINITY":30,"K_ELOQUENCY":20},
	"ASOW":{"K_IMG":"res://items/asset/attr/AncientScrollofWandering.png","K_AFFINITY":-3,"K_ELOQUENCY":5},
	"OBEE":{"K_IMG":"res://items/asset/attr/ObservationEye.png","K_ACCURACY":3,"K_EXP_GAIN":1},
	"LDB":{"K_IMG":"res://items/asset/attr/LoadBalancer.png","K_EFFICIENCY":5,"K_MAX_HP":5},
	"MMA":{"K_IMG":"res://items/asset/attr/MemoryAlloy.png","K_HP_RECOVERY_RATE":1,"K_MAX_HP":10},
	"WKOB":{"K_IMG":"res://items/asset/attr/WeaknessObserver.png","K_CRIT_RATE":5},
	"ATRP":{"K_IMG":"res://items/asset/attr/AutomaticRepairer.png","K_HP_RECOVERY_RATE":2},
	"TLP":{"K_IMG":"res://items/asset/attr/Teleprompter.png","K_ELOQUENCY":5},
	"MDEH":{"K_IMG":"res://items/asset/attr/MultidimensionalEnhancer.png","K_MAX_HP":1,"K_HP_RECOVERY_RATE":1,"K_ARMOR":1,"K_CRIT_RATE":2,"K_RICO":1},
	"LBT":{"K_IMG":"res://items/asset/attr/LubricantTube.png","K_RICO":2,"K_ADD_DMG":-3},
}
