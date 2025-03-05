extends Node


var enemy = {
	"enemy1":{
		"K_HP" : 20,
		"type":"enemy",
		"K_SPEED" : 30,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "enemy/enemy_walk_1",
		"hurt_anim": "enemy/enemy_hurt_1",
		"die_anim": "enemy/enemy_die_1",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":2
		}
	},
	"enemy2":{
		"K_HP" : 40,
		"type":"enemy",
		"K_SPEED" : 30,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "enemy/enemy_walk_2",
		"hurt_anim": "enemy/enemy_hurt_2",
		"die_anim": "enemy/enemy_die_2",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":4
		}
	},
	"enemy3":{
		"K_HP" : 60,
		"type":"enemy",
		"K_SPEED" : 30,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "enemy/enemy_walk_3",
		"hurt_anim": "enemy/enemy_hurt_3",
		"die_anim": "enemy/enemy_die_3",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":6
		}
	},
	"enemy4":{
		"K_HP" : 80,
		"type":"enemy",
		"K_SPEED" : 35,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "enemy/enemy_walk_4",
		"hurt_anim": "enemy/enemy_hurt_4",
		"die_anim": "enemy/enemy_die_4",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":8,
			"DLST":1
		}
	},
	"enemy5":{
		"K_HP" : 100,
		"type":"enemy",
		"K_SPEED" : 35,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "enemy/enemy_walk_5",
		"hurt_anim": "enemy/enemy_hurt_5",
		"die_anim": "enemy/enemy_die_5",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":10
		}
	},
	"enemy6":{
		"K_HP" : 120,
		"type":"enemy",
		"K_SPEED" : 35,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_6",
		"hurt_anim": "enemy/enemy_hurt_6",
		"die_anim": "enemy/enemy_die_6",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":12
		}
	},
	"enemy7":{
		"K_HP" : 140,
		"type":"enemy",
		"K_SPEED" : 40,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_7",
		"hurt_anim": "enemy/enemy_hurt_7",
		"die_anim": "enemy/enemy_die_7",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":14,
			"OBEE":1
		}
	},
	"enemy8":{
		"K_HP" : 160,
		"type":"enemy",
		"K_SPEED" : 40,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_8",
		"hurt_anim": "enemy/enemy_hurt_8",
		"die_anim": "enemy/enemy_die_8",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 3.0}
		],
		"itemDict": {
			"bounty":16
		}
	},
	"enemy9":{
		"K_HP" : 180,
		"type":"enemy",
		"K_SPEED" : 40,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_9",
		"hurt_anim": "enemy/enemy_hurt_9",
		"die_anim": "enemy/enemy_die_9",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":18,
			"MDB":3
		}
	},
	"enemy10":{
		"K_HP" : 200,
		"type":"enemy",
		"K_SPEED" : 45,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_10",
		"hurt_anim": "enemy/enemy_hurt_10",
		"die_anim": "enemy/enemy_die_10",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":20
		}
	},
	"enemy11":{
		"K_HP" : 220,
		"type":"enemy",
		"K_SPEED" : 45,
		"body_dmg":15,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "enemy/enemy_walk_11",
		"hurt_anim": "enemy/enemy_hurt_11",
		"die_anim": "enemy/enemy_die_11",
		"itemDict": {
			"bounty":33,
			"TPH":2,
		}
	},
	"enemy12":{
		"K_HP" : 240,
		"type":"enemy",
		"K_SPEED" : 45,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_12",
		"hurt_anim": "enemy/enemy_hurt_12",
		"die_anim": "enemy/enemy_die_12",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON25","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":36,
			"NIB":2
		}
	},
	"enemy13":{
		"K_HP" : 260,
		"type":"enemy",
		"K_SPEED" : 50,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_13",
		"hurt_anim": "enemy/enemy_hurt_13",
		"die_anim": "enemy/enemy_die_13",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":39
		}
	},
	"enemy14":{
		"K_HP" : 280,
		"type":"enemy",
		"K_SPEED" : 50,
		"body_dmg":20,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":40,
		"walk_anim": "enemy/enemy_walk_14",
		"hurt_anim": "enemy/enemy_hurt_14",
		"die_anim": "enemy/enemy_die_14",
		"itemDict": {
			"bounty":42
		}
	},
	"enemy15":{
		"K_HP" : 300,
		"type":"enemy",
		"K_SPEED" : 50,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_15",
		"hurt_anim": "enemy/enemy_hurt_15",
		"die_anim": "enemy/enemy_die_15",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":45,
			"SIB":1,
			"NIB":2
		}
	},
	"enemy16":{
		"K_HP" : 320,
		"type":"enemy",
		"K_SPEED" : 55,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_16",
		"hurt_anim": "enemy/enemy_hurt_16",
		"die_anim": "enemy/enemy_die_16",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON20","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":48
		}
	},
	"enemy17":{
		"K_HP" : 340,
		"type":"enemy",
		"K_SPEED" : 55,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_17",
		"hurt_anim": "enemy/enemy_hurt_17",
		"die_anim": "enemy/enemy_die_17",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON16","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":51,
			"STAM":2
		}
	},
	"enemy18":{
		"K_HP" : 360,
		"type":"enemy",
		"K_SPEED" : 55,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "enemy/enemy_walk_18",
		"hurt_anim": "enemy/enemy_hurt_18",
		"die_anim": "enemy/enemy_die_18",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON6","K_LV": 3.0}
		],
		"itemDict": {
			"bounty":54,
			"SIB":1,
			"NIB":2,
			"TPH":3,
			"MDB":4,
			"BKB":5,
		}
	},
	"planet1":{
		"K_HP" : 30,
		"type":"planet",
		"K_SPEED" : 20,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":20,
		"walk_anim": "planet/planet_walk_1",
		"hurt_anim": "planet/planet_hurt_1",
		"die_anim": "planet/planet_die_1",
		"itemDict": {
			"bounty":30
		}
	},
	"planet2":{
		"K_HP" : 60,
		"type":"planet",
		"K_SPEED" : 25,
		"body_dmg":8,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":20,
		"walk_anim": "planet/planet_walk_2",
		"hurt_anim": "planet/planet_hurt_2",
		"die_anim": "planet/planet_die_2",
		"itemDict": {
			"bounty":60,
			"PME":1
		}
	},
	"planet3":{
		"K_HP" : 90,
		"type":"planet",
		"K_SPEED" : 25,
		"body_dmg":10,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":20,
		"walk_anim": "planet/planet_walk_3",
		"hurt_anim": "planet/planet_hurt_3",
		"die_anim": "planet/planet_die_3",
		"itemDict": {
			"bounty":90
		}
	},
	"planet4":{
		"K_HP" : 120,
		"type":"planet",
		"K_SPEED" : 30,
		"body_dmg":12,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "planet/planet_walk_4",
		"hurt_anim": "planet/planet_hurt_4",
		"die_anim": "planet/planet_die_4",
		"itemDict": {
			"bounty":120,
			"SC_LAPIS":3
		}
	},
	"planet5":{
		"K_HP" : 150,
		"type":"planet",
		"K_SPEED" : 30,
		"body_dmg":15,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "planet/planet_walk_5",
		"hurt_anim": "planet/planet_hurt_5",
		"die_anim": "planet/planet_die_5",
		"itemDict": {
			"bounty":150,
			"IF_ORE":3
		}
	},
	"planet6":{
		"K_HP" : 180,
		"type":"planet",
		"K_SPEED" : 35,
		"body_dmg":18,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":40,
		"walk_anim": "planet/planet_walk_6",
		"hurt_anim": "planet/planet_hurt_6",
		"die_anim": "planet/planet_die_6",
		"itemDict": {
			"bounty":180
		}
	},
	"planet7":{
		"K_HP" : 210,
		"type":"planet",
		"K_SPEED" : 35,
		"body_dmg":20,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":40,
		"walk_anim": "planet/planet_walk_7",
		"hurt_anim": "planet/planet_hurt_7",
		"die_anim": "planet/planet_die_7",
		"itemDict": {
			"bounty":210,
		}
	},
	"planet8":{
		"K_HP" : 240,
		"type":"planet",
		"K_SPEED" : 40,
		"body_dmg":23,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":50,
		"walk_anim": "planet/planet_walk_8",
		"hurt_anim": "planet/planet_hurt_8",
		"die_anim": "planet/planet_die_8",
		"itemDict": {
			"bounty":240,
			"SL_STONE":1
		}
	},
	"planet9":{
		"K_HP" : 270,
		"type":"planet",
		"K_SPEED" : 40,
		"body_dmg":25,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":50,
		"walk_anim": "planet/planet_walk_9",
		"hurt_anim": "planet/planet_hurt_9",
		"die_anim": "planet/planet_die_9",
		"itemDict": {
			"bounty":270,
			"SL_STONE":2,
			"PME":3
		}
	},
	"alien1":{
		"K_HP" : 20,
		"type":"alien",
		"K_SPEED" : 30,
		"body_dmg":1,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":1,
		"walk_anim": "alien/alien_walk_1",
		"hurt_anim": "alien/alien_hurt_1",
		"die_anim": "alien/alien_die_1",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":3
		}
	},
	"alien2":{
		"K_HP" : 40,
		"type":"alien",
		"K_SPEED" : 30,
		"body_dmg":2,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":2,
		"walk_anim": "alien/alien_walk_2",
		"hurt_anim": "alien/alien_hurt_2",
		"die_anim": "alien/alien_die_2",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":6
		}
	},
	"alien3":{
		"K_HP" : 60,
		"type":"alien",
		"K_SPEED" : 30,
		"body_dmg":6,
		"body_dmg_interval": 2,
		"target_player_rate":70,
		"pause_num":4,
		"walk_anim": "alien/alien_walk_3",
		"hurt_anim": "alien/alien_hurt_3",
		"die_anim": "alien/alien_die_3",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":9
		}
	},
	"alien4":{
		"K_HP" : 80,
		"type":"alien",
		"K_SPEED" : 30,
		"body_dmg":4,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":4,
		"walk_anim": "alien/alien_walk_4",
		"hurt_anim": "alien/alien_hurt_4",
		"die_anim": "alien/alien_die_4",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":12
		}
	},
	"alien5":{
		"K_HP" : 100,
		"type":"alien",
		"K_SPEED" : 35,
		"body_dmg":4,
		"body_dmg_interval": 0.5,
		"target_player_rate":70,
		"pause_num":8,
		"walk_anim": "alien/alien_walk_5",
		"hurt_anim": "alien/alien_hurt_5",
		"die_anim": "alien/alien_die_5",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":15
		}
	},
	"alien6":{
		"K_HP" : 120,
		"type":"alien",
		"K_SPEED" : 35,
		"body_dmg":6,
		"body_dmg_interval": 0.5,
		"target_player_rate":70,
		"pause_num":12,
		"walk_anim": "alien/alien_walk_6",
		"hurt_anim": "alien/alien_hurt_6",
		"die_anim": "alien/alien_die_6",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":18
		}
	},
	"alien7":{
		"K_HP" : 140,
		"type":"alien",
		"K_SPEED" : 35,
		"body_dmg":13,
		"body_dmg_interval": 2,
		"target_player_rate":70,
		"pause_num":15,
		"walk_anim": "alien/alien_walk_7",
		"hurt_anim": "alien/alien_hurt_7",
		"die_anim": "alien/alien_die_7",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":21,
			"ANT_BOOK":3
		}
	},
	"alien8":{
		"K_HP" : 160,
		"type":"alien",
		"K_SPEED" : 40,
		"body_dmg":5,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":20,
		"walk_anim": "alien/alien_walk_8",
		"hurt_anim": "alien/alien_hurt_8",
		"die_anim": "alien/alien_die_8",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":24
		}
	},
	"alien9":{
		"K_HP" : 180,
		"type":"alien",
		"K_SPEED" : 40,
		"body_dmg":10,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":20,
		"walk_anim": "alien/alien_walk_9",
		"hurt_anim": "alien/alien_hurt_9",
		"die_anim": "alien/alien_die_9",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON6","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON6","K_LV": 1.0},
		],
		"itemDict": {
			"bounty":27
		}
	},
	"alien10":{
		"K_HP" : 200,
		"type":"alien",
		"K_SPEED" : 40,
		"body_dmg":10,
		"body_dmg_interval": 0.8,
		"target_player_rate":70,
		"pause_num":30,
		"walk_anim": "alien/alien_walk_10",
		"hurt_anim": "alien/alien_hurt_10",
		"die_anim": "alien/alien_die_10",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON28","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":50
		}
	},
	"alien11":{
		"K_HP" : 220,
		"type":"alien",
		"K_SPEED" : 45,
		"body_dmg":20,
		"body_dmg_interval": 2,
		"target_player_rate":70,
		"pause_num":40,
		"walk_anim": "alien/alien_walk_11",
		"hurt_anim": "alien/alien_hurt_11",
		"die_anim": "alien/alien_die_11",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON9","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":55
		}
	},
	"alien12":{
		"K_HP" : 240,
		"type":"alien",
		"K_SPEED" : 45,
		"body_dmg":10,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":60,
		"walk_anim": "alien/alien_walk_12",
		"hurt_anim": "alien/alien_hurt_12",
		"die_anim": "alien/alien_die_12",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":60,
			"DIARY":4
		}
	},
	"alien13":{
		"K_HP" : 260,
		"type":"alien",
		"K_SPEED" : 45,
		"body_dmg":12,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":2,
		"walk_anim": "alien/alien_walk_13",
		"hurt_anim": "alien/alien_hurt_13",
		"die_anim": "alien/alien_die_13",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":65
		}
	},
	"alien14":{
		"K_HP" : 280,
		"type":"alien",
		"K_SPEED" : 50,
		"body_dmg":23,
		"body_dmg_interval": 1.5,
		"target_player_rate":70,
		"pause_num":45,
		"walk_anim": "alien/alien_walk_14",
		"hurt_anim": "alien/alien_hurt_14",
		"die_anim": "alien/alien_die_14",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 1.0}
		],
		"itemDict": {
			"bounty":80,
			"FVE":1,
		}
	},
	"alien15":{
		"K_HP" : 300,
		"type":"alien",
		"K_SPEED" : 50,
		"body_dmg":20,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":10,
		"walk_anim": "alien/alien_walk_15",
		"hurt_anim": "alien/alien_hurt_15",
		"die_anim": "alien/alien_die_15",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON6","K_LV": 2.0}
		],
		"itemDict": {
			"bounty":75
		}
	},
	"alien16":{
		"K_HP" : 320,
		"type":"alien",
		"K_SPEED" : 50,
		"body_dmg":25,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":35,
		"walk_anim": "alien/alien_walk_16",
		"hurt_anim": "alien/alien_hurt_16",
		"die_anim": "alien/alien_die_16",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON28","K_LV": 1.0},
			{"K_WEAPON_NAME":"WEAPON28","K_LV": 1.0},
		],
		"itemDict": {
			"bounty":80,
			"ANT_TAB":5
		}
	},
	"alien17":{
		"K_HP" : 340,
		"type":"alien",
		"K_SPEED" : 50,
		"body_dmg":60,
		"body_dmg_interval": 1,
		"target_player_rate":70,
		"pause_num":5,
		"walk_anim": "alien/alien_walk_17",
		"hurt_anim": "alien/alien_hurt_17",
		"die_anim": "alien/alien_die_17",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON9","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON9","K_LV": 2.0},
		],
		"itemDict": {
			"bounty":85
		}
	}
}

var snpc = {#speed set as based on enemy*5
	"SNPC_AD":{
		"K_HP" : 4000,
		"K_SPEED" : 25,
		"walk_anim": "ad_walk",
		"hurt_anim": "ad_hurt",
		"die_anim": "ad_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 1.0}
		],
		"itemDict": {
			"LIGHT_ORE":2,
			"HEAVY_ORE":2,
			"bounty":2000
		}
	},
	"SNPC_NE":{
		"K_HP" : 4000,
		"K_SPEED" : 25,
		"walk_anim": "ne_walk",
		"hurt_anim": "ne_hurt",
		"die_anim": "ne_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 1.0}
		]
	},
	"SNPC_ALG":{
		"K_HP" : 8000,
		"K_SPEED" : 35,
		"walk_anim": "alg_walk",
		"hurt_anim": "alg_hurt",
		"die_anim": "alg_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON16","K_LV": 2.0}
		],
		"itemDict": {
			"SCSL":1,
			"bounty":4000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/1.png",
				"sat_anim":"alg_sat0",
				"num":10,
				"dmg":20,
				"speed":100,
				"cd":20,
				"trace_num":100#change dir for each process
			}
		}
	},
	"SNPC_ARG":{
		"K_HP" : 8000,
		"K_SPEED" : 35,
		"walk_anim": "arg_walk",
		"hurt_anim": "arg_hurt",
		"die_anim": "arg_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON20","K_LV": 2.0}
		],
		"itemDict": {
			"HVSL":1,
			"bounty":4000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/2.png",
				"sat_anim":"arg_sat0",
				"num":12,
				"dmg":40,
				"speed":100,
				"cd":20,
				"trace_num":100#change dir for each process
			}
		}
	},
	"SNPC_WW":{
		"K_HP" : 8000,
		"K_SPEED" : 40,
		"walk_anim": "ww_walk",
		"hurt_anim": "ww_hurt",
		"die_anim": "ww_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 3.0}
		],
		"itemDict": {
			"SSSL":1,
			"bounty":4000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/11.png",
				"sat_anim":"ww_sat0",
				"num":4,
				"dmg":200,
				"speed":300,
				"cd":20,
				"trace_num":300#change dir for each process
			}
		}
	},
	"SNPC_FF":{
		"K_HP" : 12000,
		"K_SPEED" : 40,
		"walk_anim": "ff_walk",
		"hurt_anim": "ff_hurt",
		"die_anim": "ff_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0}
		],
		"itemDict": {
			"ODSL":1,
			"bounty":5000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/8.png",
				"sat_anim":"ff_sat0",
				"num":30,
				"dmg":20,
				"speed":150,
				"cd":30,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/14.png",
				"sat_anim":"ff_sat1",
				"num":2,
				"dmg":300,
				"speed":300,
				"cd":40,
				"trace_num":200#change dir for each process
			}
		}
	},
	"SNPC_FH":{
		"K_HP" : 16000,
		"K_SPEED" : 45,
		"walk_anim": "fh_walk",
		"hurt_anim": "fh_hurt",
		"die_anim": "fh_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON25","K_LV": 3.0}
		],
		"itemDict": {
			"BSB":1,
			"bounty":6000
		},
		"sat_cd":5,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/10.png",
				"sat_anim":"fh_sat0",
				"num":2,
				"dmg":300,
				"speed":300,
				"cd":25,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/16.png",
				"sat_anim":"fh_sat1",
				"num":40,
				"dmg":30,
				"speed":300,
				"cd":15,
				"trace_num":100#change dir for each process
			}
		}
	},
	"SNPC_CS":{
		"K_HP" : 25000,
		"K_SPEED" : 45,
		"walk_anim": "cs_walk",
		"hurt_anim": "cs_hurt",
		"die_anim": "cs_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON25","K_LV": 3.0}
		],
		"itemDict": {
			"EGSL":1,
			"bounty":7000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/15.png",
				"sat_anim":"cs_sat0",
				"num":10,
				"dmg":30,
				"speed":300,
				"cd":60,
				"trace_num":20#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/12.png",
				"sat_anim":"cs_sat1",
				"num":50,
				"dmg":30,
				"speed":300,
				"cd":60,
				"trace_num":30#change dir for each process
			}
		}
	},
	"SNPC_HP":{#hp>ff a little
		"K_HP" : 40000,
		"K_SPEED" : 50,
		"walk_anim": "hp_walk",
		"hurt_anim": "hp_hurt",
		"die_anim": "hp_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON25","K_LV": 3.0}
		],
		"itemDict": {
			"ETTB":2,
			"bounty":8000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/21.png",
				"sat_anim":"hp_sat0",
				"num":1,
				"dmg":400,
				"speed":300,
				"cd":20,
				"trace_num":150#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/30.png",
				"sat_anim":"hp_sat1",
				"num":30,
				"dmg":30,
				"speed":150,
				"cd":15,
				"trace_num":30#change dir for each process
			}
		}
	},
	"SNPC_PA":{
		"K_HP" : 80000,
		"K_SPEED" : 50,
		"walk_anim": "pa_walk",
		"hurt_anim": "pa_hurt",
		"die_anim": "pa_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON6","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 4.0}
		],
		"itemDict": {
			"bounty":10000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/16.png",
				"sat_anim":"pa_sat0",
				"num":80,
				"dmg":10,
				"speed":300,
				"cd":10,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/5.png",
				"sat_anim":"pa_sat1",
				"num":4,
				"dmg":500,
				"speed":150,
				"cd":35,
				"trace_num":100#change dir for each process
			},
			2:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/18.png",
				"sat_anim":"pa_sat2",
				"num":20,
				"dmg":10,
				"speed":300,
				"cd":40,
				"trace_num":40#change dir for each process
			},
			3:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/19.png",
				"sat_anim":"pa_sat3",
				"num":40,
				"dmg":100,
				"speed":150,
				"cd":50,
				"trace_num":20#change dir for each process
			}
		}
	},
	"SNPC_ILG":{
		"K_HP" : 8000,
		"K_SPEED" : 35,
		"walk_anim": "ilg_walk",
		"hurt_anim": "ilg_hurt",
		"die_anim": "ilg_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON16","K_LV": 2.0}
		],
		"itemDict": {
			"FPCB":1,
			"bounty":4000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/25.png",
				"sat_anim":"ilg_sat0",
				"num":10,
				"dmg":20,
				"speed":100,
				"cd":20,
				"trace_num":100#change dir for each process
			}
		}
	},
	"SNPC_IRG":{
		"K_HP" : 8000,
		"K_SPEED" : 35,
		"walk_anim": "irg_walk",
		"hurt_anim": "irg_hurt",
		"die_anim": "irg_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 2.0}
		],
		"itemDict": {
			"BMB":1,
			"bounty":4000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/26.png",
				"sat_anim":"irg_sat0",
				"num":10,
				"dmg":20,
				"speed":100,
				"cd":20,
				"trace_num":100#change dir for each process
			}
		}
	},
	"SNPC_ZJY":{
		"K_HP" : 40000,
		"K_SPEED" : 40,
		"walk_anim": "zjy_walk",
		"hurt_anim": "zjy_hurt",
		"die_anim": "zjy_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON16","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 2.0}
		],
		"itemDict": {
			"PGTB":1,
			"bounty":6000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/20.png",
				"sat_anim":"zjy_sat0",
				"num":10,
				"dmg":20,
				"speed":100,
				"cd":15,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/4.png",
				"sat_anim":"zjy_sat1",
				"num":20,
				"dmg":20,
				"speed":100,
				"cd":30,
				"trace_num":50#change dir for each process
			}
		}
	},
	"SNPC_ZTB":{
		"K_HP" : 50000,
		"K_SPEED" : 40,
		"walk_anim": "ztb_walk",
		"hurt_anim": "ztb_hurt",
		"die_anim": "ztb_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 3.0}
		],
		"itemDict": {
			"BDB":3,
			"bounty":8000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/27.png",
				"sat_anim":"ztb_sat0",
				"num":18,
				"dmg":40,
				"speed":100,
				"cd":10,
				"trace_num":200#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/6.png",
				"sat_anim":"ztb_sat1",
				"num":2,
				"dmg":50,
				"speed":300,
				"cd":15,
				"trace_num":10#change dir for each process
			},
			2:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/24.png",
				"sat_anim":"ztb_sat2",
				"num":20,
				"dmg":20,
				"speed":300,
				"cd":40,
				"trace_num":50#change dir for each process
			}
		}
	},
	"SNPC_EMP":{
		"K_HP" : 100000,
		"K_SPEED" : 50,
		"walk_anim": "emp_walk",
		"hurt_anim": "emp_hurt",
		"die_anim": "emp_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON16","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 4.0}
		],
		"itemDict": {
			"bounty":10000
		},
		"sat_cd":5,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/13.png",
				"sat_anim":"emp_sat0",
				"num":100,
				"dmg":20,
				"speed":150,
				"cd":20,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/15.png",
				"sat_anim":"emp_sat1",
				"num":20,
				"dmg":30,
				"speed":150,
				"cd":25,
				"trace_num":80#change dir for each process
			},
			2:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/6.png",
				"sat_anim":"emp_sat2",
				"num":4,
				"dmg":100,
				"speed":300,
				"cd":15,
				"trace_num":10#change dir for each process
			},
			3:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/20.png",
				"sat_anim":"emp_sat3",
				"num":60,
				"dmg":10,
				"speed":300,
				"cd":30,
				"trace_num":50#change dir for each process
			}
		}
	},
	"SNPC_IBGC":{#Guard Commander of the ImperialBlade Army 
		"K_HP" : 12000,
		"K_SPEED" : 35,
		"walk_anim": "ibgc_walk",
		"hurt_anim": "ibgc_hurt",
		"die_anim": "ibgc_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON16","K_LV": 2.0}
		],
		"itemDict": {
			"ETTB":1,
			"bounty":3000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/1.png",
				"sat_anim":"ibgc_sat0",
				"num":20,
				"dmg":30,
				"speed":150,
				"cd":20,
				"trace_num":100#change dir for each process
			}
		}
	},
	"SNPC_RB":{#REBEL
		"K_HP" : 20000,
		"K_SPEED" : 40,
		"walk_anim": "rb_walk",
		"hurt_anim": "rb_hurt",
		"die_anim": "rb_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 2.0}
		],
		"itemDict": {
			"ETTB":2,
			"bounty":5000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/8.png",
				"sat_anim":"rb_sat0",
				"num":30,
				"dmg":30,
				"speed":150,
				"cd":15,
				"trace_num":120#change dir for each process
			}
		}
	},
	"SNPC_ZD":{
		"K_HP" : 40000,
		"K_SPEED" : 45,
		"walk_anim": "zd_walk",
		"hurt_anim": "zd_hurt",
		"die_anim": "zd_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON30","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON31","K_LV": 2.0},
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 3.0}
		],
		"itemDict": {
			"ETTB":3,
			"bounty":7500
		},
		"sat_cd":20,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/19.png",
				"sat_anim":"zd_sat0",
				"num":30,
				"dmg":50,
				"speed":150,
				"cd":15,
				"trace_num":40#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/31.png",
				"sat_anim":"zd_sat1",
				"num":10,
				"dmg":20,
				"speed":100,
				"cd":60,
				"trace_num":20#change dir for each process
			}
		}
	},
	"SNPC_HS":{
		"K_HP" : 30000,
		"K_SPEED" : 50,
		"walk_anim": "hs_walk",
		"hurt_anim": "hs_hurt",
		"die_anim": "hs_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON32","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON24","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON29","K_LV": 3.0}
		],
		"itemDict": {
			"BCB":1,
			"bounty":5000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/15.png",
				"sat_anim":"hs_sat0",
				"num":20,
				"dmg":20,
				"speed":100,
				"cd":15,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/32.png",
				"sat_anim":"hs_sat1",
				"num":4,
				"dmg":150,
				"speed":400,
				"cd":20,
				"trace_num":50#change dir for each process
			}
		}},
	"SNPC_VI":{
		"K_HP" : 80000,
		"K_SPEED" : 35,
		"walk_anim": "vi_walk",
		"hurt_anim": "vi_hurt",
		"die_anim": "vi_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON11","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON12","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON13","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON14","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON15","K_LV": 3.0}
		],
		"itemDict": {
			"bounty":10000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/29.png",
				"sat_anim":"vi_sat0",
				"num":50,
				"dmg":40,
				"speed":100,
				"cd":10,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/28.png",
				"sat_anim":"vi_sat1",
				"num":2,
				"dmg":50,
				"speed":300,
				"cd":15,
				"trace_num":10#change dir for each process
			},
			2:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/33.png",
				"sat_anim":"vi_sat2",
				"num":12,
				"dmg":40,
				"speed":100,
				"cd":20,
				"trace_num":100#change dir for each process
			},
			3:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/9.png",
				"sat_anim":"vi_sat3",
				"num":4,
				"dmg":50,
				"speed":300,
				"cd":30,
				"trace_num":30#change dir for each process
			}
		}
	},
	"SNPC_ZDR":{
		"K_HP" : 40000,
		"K_SPEED" : 35,
		"walk_anim": "zdr_walk",
		"hurt_anim": "zdr_hurt",
		"die_anim": "zdr_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON28","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON28","K_LV": 3.0},
			{"K_WEAPON_NAME":"WEAPON28","K_LV": 3.0}
		],
		"itemDict": {
			"bounty":8000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/28.png",
				"sat_anim":"zdr_sat0",
				"num":60,
				"dmg":20,
				"speed":150,
				"cd":15,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/29.png",
				"sat_anim":"zdr_sat1",
				"num":2,
				"dmg":300,
				"speed":300,
				"cd":20,
				"trace_num":20#change dir for each process
			}
		}
	},
	"SNPC_ZDR2":{#UNCHANGE GENE PORTION
		"K_HP" : 32000,
		"K_SPEED" : 35,
		"walk_anim": "zdr2_walk",
		"hurt_anim": "zdr2_hurt",
		"die_anim": "zdr2_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON9","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON9","K_LV": 4.0},
			{"K_WEAPON_NAME":"WEAPON9","K_LV": 4.0}
		],
		"itemDict": {
			"bounty":6000
		},
		"sat_cd":10,
		"sat_dict":{
			0:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/9.png",
				"sat_anim":"zdr2_sat0",
				"num":60,
				"dmg":30,
				"speed":150,
				"cd":15,
				"trace_num":100#change dir for each process
			},
			1:{#todo:at this moment, didnt add explosion,maybe in the future
				"bullet_img":"res://asset/weapon/bullet/31.png",
				"sat_anim":"zdr2_sat1",
				"num":2,
				"dmg":200,
				"speed":300,
				"cd":20,
				"trace_num":20#change dir for each process
			}
		}
	},
	"SNPC_ACM":{
		"K_HP" : 500,
		"K_SPEED" : 30,
		"walk_anim": "acm_walk",
		"hurt_anim": "acm_hurt",
		"die_anim": "acm_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 2.0}
		]
	},
	"SNPC_ACM2":{
		"K_HP" : 1000,
		"K_SPEED" : 40,
		"walk_anim": "acm_walk",
		"hurt_anim": "acm_hurt",
		"die_anim": "acm_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 3.0}
		]
	},
	"SNPC_ACS":{
		"K_HP" : 500,
		"K_SPEED" : 30,
		"walk_anim": "acs_walk",
		"hurt_anim": "acs_hurt",
		"die_anim": "acs_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 2.0}
		]
	},
	"SNPC_ACS2":{
		"K_HP" : 1000,
		"K_SPEED" : 40,
		"walk_anim": "acs_walk",
		"hurt_anim": "acs_hurt",
		"die_anim": "acs_die",
		"weapon_list" : [
			{"K_WEAPON_NAME":"WEAPON33","K_LV": 3.0}
		]
	},
}

const battle_field_maps = [
	"res://asset/map/al_cs.png",
	"res://asset/map/al_ff.png",
	"res://asset/map/al_fh.png",
	"res://asset/map/al_hp.png",
	"res://asset/map/al_pa.png",
	"res://asset/map/al_spl.png",
	"res://asset/map/al_ts.png",
	"res://asset/map/al_ww.png",
	"res://asset/map/gs_pr.png",
	"res://asset/map/ip_def.png",
	"res://asset/map/ip_def2.png",
	"res://asset/map/ip_def3.png",
	"res://asset/map/ip_emp.png",
	"res://asset/map/ip_ht.png",
	"res://asset/map/ip_zjy.png",
	"res://asset/map/ip_ztb.png",
	"res://asset/map/neu.png",
	"res://asset/map/pf.png",
	"res://asset/map/pr_gs.png",
	"res://asset/map/ps_pw.png",
	"res://asset/map/ps_pw2.png",
	"res://asset/map/pw_zdr.png",
	"res://asset/map/pw_zdr2.png"
]

const battle_field_bgms = [
	"res://asset/music/battle/8bit-Battle01_loop.ogg",
	"res://asset/music/battle/Battle-Conflict_loop.ogg",
	"res://asset/music/battle/Battle-Dawn_loop.ogg",
	"res://asset/music/battle/Battle-rapier_loop.ogg",
	"res://asset/music/battle/Battle-Grief_loop.ogg",
	"res://asset/music/battle/Battle-Furious-GUITAR_loop.ogg",
	"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
	"res://asset/music/battle/Battle-SilverMoon_loop.ogg",
	"res://asset/music/battle/Battle-Vampire_loop.ogg",
	"res://asset/music/battle/War_of_Exploding_Mountains.ogg",

	"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
	"res://asset/music/battle/BGM07battle1.wav",
	"res://asset/music/battle/BGM07battle2.wav",
	"res://asset/music/battle/BGM07battle3.wav",
	"res://asset/music/battle/BGM07battle4.wav",
	"res://asset/music/battle/Track4.ogg",
	"res://asset/music/battle/Track6_Bonus1.ogg",
	"res://asset/music/battle/Track7_Bonus2.ogg",
]

const LV_FIELD = {
	1:{
		"basic_time": 60,#so 30s, dps50
		"enemy_multiplier":1,
		"enemy_list" : ["enemy1","alien1"]
	},
	2:{
		"basic_time": 65,
		"enemy_multiplier":1,
		"enemy_list" : ["enemy1","enemy2","alien1","alien2","planet1"]
	},
	3:{
		"basic_time": 70,
		"enemy_multiplier":1,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","planet1"]
	},
	4:{
		"basic_time": 75,
		"enemy_multiplier":1,
		"enemy_list" : ["alien1","alien2","alien3","alien4","planet1","planet2"]
	},
	5:{
		"basic_time": 80,
		"enemy_multiplier":1,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","alien1","alien2","alien3","alien4","planet1","planet2"],
		"special_npc_list" : ["SNPC_AD"],
	},
	6:{
		"basic_time": 85,
		"enemy_multiplier":1,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5",
			"alien1","alien2","alien3","alien4","alien5",
			"planet1","planet2","planet3"],
	},
	7:{
		"basic_time": 90,
		"enemy_multiplier":1,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6",
			"alien1","alien2","alien3","alien4","alien5","alien6",
			"planet1","planet2","planet3"],
	},
	8:{
		"basic_time": 95,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7",
			"planet1","planet2","planet3"],
	},
	9:{
		"basic_time": 100,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8",
			"planet1","planet2","planet3","planet4"],
	},
	10:{
		"basic_time": 105,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8","enemy9",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9",
			"planet1","planet2","planet3","planet4"],
		"special_npc_list" : ["SNPC_ZJY"],
	},
	11:{
		"basic_time": 110,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8","enemy9","enemy10",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9","alien10",
			"planet1","planet2","planet3","planet4"],
	},
	12:{
		"basic_time": 115,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6",
			"enemy7","enemy8","enemy9","enemy10","enemy11",
			"alien1","alien2","alien3","alien4","alien5",
			"alien6","alien7","alien8","alien9","alien10","alien11",
			"planet1","planet2","planet3","planet4","planet5"],
		"special_npc_list" : ["SNPC_ZDR2"],
	},
	13:{
		"basic_time": 120,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6",
			"enemy7","enemy8","enemy9","enemy10","enemy11","enemy12",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7",
			"alien8","alien9","alien10","alien11","alien12",
			"planet1","planet2","planet3","planet4","planet5"],
	},
	14:{
		"basic_time": 125,
		"enemy_multiplier":2,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6",
			"enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","enemy13",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8",
			"alien9","alien10","alien11","alien12","alien13",
			"planet1","planet2","planet3","planet4","planet5"],
		"special_npc_list" : ["SNPC_ZD"],
	},
	15:{
		"basic_time": 130,
		"enemy_multiplier":3,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6",
			"enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","enemy13","enemy14",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7",
			"alien8","alien9","alien10","alien11","alien12","alien13","alien14",
			"planet1","planet2","planet3","planet4","planet5","planet6"],
	},
	16:{
		"basic_time": 135,
		"enemy_multiplier":3,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
			"enemy9","enemy10","enemy11","enemy12","enemy13","enemy14","enemy15",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9",
			"alien10","alien11","alien12","alien13","alien14","alien15",
			"planet1","planet2","planet3","planet4","planet5","planet6"],
		"special_npc_list" : ["SNPC_ZTB"],
	},
	17:{
		"basic_time": 140,
		"enemy_multiplier":3,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
			"enemy9","enemy10","enemy11","enemy12","enemy13","enemy14","enemy15","enemy16",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9",
			"alien10","alien11","alien12","alien13","alien14","alien15","alien16",
			"planet1","planet2","planet3","planet4","planet5","planet6","planet7"],
	},
	18:{
		"basic_time": 145,
		"enemy_multiplier":3,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
			"enemy9","enemy10","enemy11","enemy12","enemy13","enemy14","enemy15","enemy16","enemy17",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9",
			"alien10","alien11","alien12","alien13","alien14","alien15","alien16","alien17",
			"planet1","planet2","planet3","planet4","planet5","planet6","planet7","planet8"],
		"special_npc_list" : ["SNPC_PA"],
	},
	19:{
		"basic_time": 150,
		"enemy_multiplier":3,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
			"enemy9","enemy10","enemy11","enemy12","enemy13","enemy14","enemy15","enemy16","enemy17","enemy18",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9",
			"alien10","alien11","alien12","alien13","alien14","alien15","alien16","alien17",
			"planet1","planet2","planet3","planet4","planet5","planet6","planet7","planet8","planet9"],
	},
	20:{
		"basic_time": 150,
		"enemy_multiplier":3,
		"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
			"enemy9","enemy10","enemy11","enemy12","enemy13","enemy14","enemy15","enemy16","enemy17","enemy18",
			"alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8","alien9",
			"alien10","alien11","alien12","alien13","alien14","alien15","alien16","alien17",
			"planet1","planet2","planet3","planet4","planet5","planet6","planet7","planet8","planet9"],
		"special_npc_list" : ["SNPC_EMP"],
	},

}
