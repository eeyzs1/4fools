extends Node

#fight 1st then communicate
#each stage has multiple scenarios, then each scenario has multiple lines
const Stages = {
	"N_IC":{
		1 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S1L1"},
					{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S1L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S1L3"},
					{"avatar":true,"dialogue":"S1L4"},
					{"avatar":false,"dialogue":"S1L5"},
					{"avatar":true,"dialogue":"S1L6"},
					{"avatar":false,"dialogue":"S1L7"},
					{"avatar":true,"dialogue":"S1L8"},
					{"rewards": {"index":0,
							"S1L8R1":{"K_MAX_HP": 2, "K_ADD_DMG": 1},
							"S1L8R2":{"K_MAX_HP": 2, "item": "LIGHT_ORE"},
							"S1L8R3":{"K_MAX_HP": 2, "K_ADD_DMG": 1, "item": "LIGHT_ORE"}
					}},
					{"avatar":false,"dialogue":"S1L9"},
					{"avatar":true,"dialogue":"S1L10"},
					{"avatar":false,"dialogue":"S1L11"},
					{"choices":{"index":1,
							"S1L12C1": {
								"next_stage_index": 88
							},
							"S1L12C2": {
								"next_stage_index": 2,
								"market":"neutral_market1",
								"battle_field":{
									"basic_time": 40,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
									"map":"res://asset/map/gs_pr.png",
									"enemy_list" : ["enemy2"],
									"fail_stage_index": 44,
									"special_npc_list" : [{
										"name":"SNPC_AD",
										"is_ally": false,
										"action_mode":1,#away
										"debutant_lines": ["S1L15","S1L14"],
										"destroy_stage_index": 126
					}]}}}}],
					"bg_image": "res://asset/bgim/giant_shelter_prr.png",
					"bg_music": "res://asset/music/stage/Ancient Woods.ogg"
				}]
		},
		2 : {"scenario_list" :
				[
					{"line":[
						{"avatar":false,"dialogue":"S2L1"},
						{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S2L2"},
						{"name":"N_SM","avatar":true,"image":"res://asset/avatar/sm.png","dialogue":"S2L3"},
						{"avatar":true,"dialogue":"S2L4"},
						{"avatar":false,"dialogue":"S2L5"},
						{"avatar":true,"dialogue":"S2L6"},
						{"avatar":false,"dialogue":"S2L7"},
						{"avatar":true,"dialogue":"S2L8",},
						{"avatar":false,"dialogue":"S2L9"},
						{"avatar":true,"dialogue":"S2L10"},
						{"name":"N_AS","avatar":false,"image":"res://asset/main_character/AS/base.png","dialogue":"S2L11"},
						{"avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S2L12"},
						{"avatar":false,"dialogue":"S2L13"},
						{"avatar":true,"dialogue":"S2L14"},
						{"avatar":false,"dialogue":"S2L15"},
						{"avatar":true,"dialogue":"S2L16"},
						{"avatar":true,"dialogue":"S2L17"},
						{"name":"N_SM","avatar":true,"image":"res://asset/avatar/sm.png","dialogue":"S2L18"},
						{"avatar":false,"dialogue":"S2L9"},
						{"avatar":true,"dialogue":"S2L20",},
						{"avatar":false,"dialogue":"S2L21"},
						{"rewards": {
								"index":0,
								"S2L22R1":{"K_INTELLIGENCE": 2},
								"S2L22R2":{"K_SANITY": 2}
						}}],
					"bg_image": "res://asset/bgim/peacerealm_realm_gov.png",
					"bg_music": "res://asset/music/stage/Harbingers.ogg"
					},
					{"line":[
						{"avatar":false,"dialogue":"S3L1"},
						{"name":"N_SM","avatar":true,"image":"res://asset/avatar/sm.png","dialogue":"S3L2"},
						{"choices":{
								"index":1,
								"S3L3C1": {
									"next_stage_index": 3,
									"market":"charm_market1"
								},
								"S3L3C2": {
									"next_stage_index": 44,
									"market":"neutral_market1",
									"battle_field":{
										"basic_time": 60,
										"enemy_multiplier":2,
										"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
										"map":"res://asset/map/gs_pr.png",
										"enemy_list" : ["enemy1","enemy2"],
										"fail_stage_index": 44,
										"special_npc_list" : [{
											"name":"SNPC_AD",
											"is_ally": false,
											"action_mode":1,#away
											"debutant_lines": ["S1L14", "S1L15"],
											"destroy_stage_index": 126,
										}],
						}}}}],
					"bg_image": "res://asset/bgim/peacerealm_realm_wmrk.png"
					},
				],
			"comman_market":"charm_market1"
		},
		3 : {"scenario_list" :
				[{"line":[
						{"avatar":false,"dialogue":"S4L1"},
						{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S4L2"},
						{"name":"N_SM","avatar":true,"image":"res://asset/avatar/sm.png","dialogue":"S4L3"},
						{"avatar":false,"dialogue":"S4L4"},
						{"avatar":true,"dialogue":"S4L5"},
						{"avatar":false,"dialogue":"S4L6"},
						],
					"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png",
					"bg_music": "res://asset/music/stage/Rise Up The Sword.ogg"
					},
					{"line":[
						{"avatar":false,"dialogue":"S5L1"},
						{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S5L2"},
						{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S5L3"},
						{"avatar":false,"dialogue":"S5L4"},
						{"avatar":true,"dialogue":"S5L5"},
						{"avatar":false,"dialogue":"S5L6"},
						{"avatar":true,"dialogue":"S5L7"},
						{"avatar":false,"dialogue":"S5L8"},
						{"avatar":true,"dialogue":"S5L9"},
						{"avatar":false,"dialogue":"S5L10"},
						{"avatar":true,"dialogue":"S5L11"},
						{"avatar":false,"dialogue":"S5L12"},
						{"avatar":true,"dialogue":"S5L13"},
						{"avatar":false,"dialogue":"S5L14"},
						{"avatar":true,"dialogue":"S5L15"},
						{"avatar":false,"dialogue":"S5L16"},
						{"avatar":true,"dialogue":"S5L17"},
						{"avatar":false,"dialogue":"S5L18"},
						{"avatar":true,"dialogue":"S5L19"},
						{"avatar":false,"dialogue":"S5L20"},
						{"avatar":true,"dialogue":"S5L21"},
						{"avatar":false,"dialogue":"S5L22"},
						{"avatar":true,"dialogue":"S5L23"},
						{"avatar":false,"dialogue":"S5L24"},
						{"avatar":true,"dialogue":"S5L25"},
						{"avatar":false,"dialogue":"S5L26"},
						{"avatar":true,"dialogue":"S5L27"},
						{"avatar":false,"dialogue":"S5L28"},
						{"avatar":true,"dialogue":"S5L29"},
						{"avatar":false,"dialogue":"S5L30"},
						{"avatar":true,"dialogue":"S5L31"},
						{"avatar":false,"dialogue":"S5L32"},
						{"avatar":true,"dialogue":"S5L33"},
						{"avatar":false,"dialogue":"S5L34"},
						{"avatar":true,"dialogue":"S5L35"},
						{"avatar":false,"dialogue":"S5L36"},
						{"avatar":true,"dialogue":"S5L37"},
						{"avatar":false,"dialogue":"S5L38"},
						],
					"bg_image": "res://asset/bgim/peacerealm_realm_ghh_lwh.png"
					},
					{"line":[
						{"avatar":false,"dialogue":"S6L1"},
						{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S6L2"},
						{"name":"N_SM","avatar":true,"image":"res://asset/avatar/sm.png","dialogue":"S6L3"},
						{"avatar":false,"dialogue":"S6L4"},
						{"avatar":true,"dialogue":"S6L5"},
						{"avatar":false,"dialogue":"S6L6"},
						{"avatar":true,"dialogue":"S6L7"},
						{"avatar":false,"dialogue":"S6L8"},
						{"avatar":true,"dialogue":"S6L9"},
						{"choices":{
								"index":0,
								"S6L10C1": {
									"next_stage_index": 4,
									"req":{"K_INTELLIGENCE": 12},
								},
								"S6L10C2": {
									"next_stage_index": 58,
									"req":{"K_SANITY": 12},
								},
								"S6L10C3": {
									"next_stage_index": 56
						}}}],
					"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png"
					},
				],
		},
		4 : {"scenario_list" :
				[{"line":[
						{"avatar":false,"dialogue":"S7L1"},
						{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S7L2"},
						{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S7L3"},
						{"avatar":true,"dialogue":"S7L4"},
						{"avatar":false,"dialogue":"S7L5"},
						{"avatar":true,"dialogue":"S7L6"},
						{"avatar":false,"image":"res://asset/main_character/AD/surprised_open_mouth_a.png","dialogue":"S7L7"},
						{"avatar":true,"dialogue":"S7L8"},
						{"avatar":false,"dialogue":"S7L9"},
						{"avatar":true,"dialogue":"S7L10"},
						{"avatar":false,"dialogue":"S7L11"},
						{"avatar":true,"dialogue":"S7L12"},
						{"avatar":false,"dialogue":"S7L13"},
						{"choices":{
								"index":0,
								"S7L14C1": {
									"next_stage_index": 5,
									"req":{"K_ELOQUENCY": 1},
								},
								"S7L14C2": {
									"next_stage_index": 58,
						}}}
						],
					"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png",
					"bg_music": "res://asset/music/stage/Well-knownToMyHeart.ogg"
					}
				],
		},
	5 : {"scenario_list" : 
			[{"line":[{"avatar":false,"dialogue":"S8L1"},
					{"name":"N_AD","avatar":true,"image":"res://asset/main_character/AD/avatar.png","dialogue":"S8L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S8L3"},
					{"avatar":true,"image":"res://asset/main_character/AD/avatar.png","dialogue":"S8L4"},
					{"avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S8L5"},
					{"avatar":true,"image":"res://asset/main_character/AD/avatar.png","dialogue":"S8L6"},],
				"bg_image": "res://asset/bgim/emperor_capital.png",
				"bg_music": "res://asset/music/stage/Old Forest.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S8L7"},
					{"name":"N_WF","avatar":true,"image":"res://asset/avatar/wf.png","dialogue":"S8L8"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S8L9"},
					{"avatar":true,"dialogue":"S8L10"},
					{"avatar":false,"dialogue":"S8L11"},
					{"avatar":true,"dialogue":"S8L12"},
					{"avatar":false,"dialogue":"S8L13"},
					{"avatar":true,"dialogue":"S8L14"},
					{"avatar":true,"dialogue":"S8L15"},
					{"avatar":false,"dialogue":"S8L16"},
					{"avatar":true,"dialogue":"S8L17"},],
				"bg_image": "res://asset/bgim/imperial_palace_fah.png",
				"bg_music": "res://asset/music/stage/Let There Be Night.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S9L1"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S9L2"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/shy_blush.png","dialogue":"S9L3"},
					{"avatar":true,"dialogue":"S9L4"},
					{"avatar":false,"dialogue":"S9L5"},
					{"avatar":true,"dialogue":"S9L6"},
					{"avatar":false,"dialogue":"S9L7"},
					{"avatar":true,"dialogue":"S9L8"},
					{"avatar":false,"dialogue":"S9L9"},
					{"avatar":true,"dialogue":"S9L10"},
					{"avatar":false,"dialogue":"S9L11"},
					{"avatar":true,"dialogue":"S9L12"},
					{"avatar":false,"dialogue":"S10L1"},
					{"avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S10L2"},
					{"avatar":false,"image":"res://asset/main_character/AD/smile_open_mouth.png","dialogue":"S10L3"},
					{"avatar":true,"dialogue":"S10L4"},
					{"avatar":false,"dialogue":"S10L5"},
					{"avatar":true,"dialogue":"S10L6"},
					{"avatar":false,"dialogue":"S10L7"},
					{"avatar":true,"dialogue":"S10L8"},
					{"avatar":false,"dialogue":"S10L9"},
					{"avatar":true,"dialogue":"S10L10"},
					{"avatar":false,"dialogue":"S10L11"},
					{"avatar":true,"dialogue":"S10L12"},
					{"avatar":false,"dialogue":"S10L13"},
					{"avatar":true,"dialogue":"S10L14"},
					{"avatar":false,"dialogue":"S10L15"},
					{"name":"","avatar":false,"dialogue":"S10L16"},
					{"avatar":false,"image":"res://asset/main_character/AD/grin.png","dialogue":"S10L17"},
					{"avatar":true,"image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S10L18"},
					{"avatar":false,"dialogue":"S10L19"},
					{"choices":{"index":0,
							"S10L20C1": {
								"next_stage_index": 6,
							},
							"S10L20C2": {
								"next_stage_index": 24,
							}
						}},],
				"bg_image": "res://asset/bgim/imperial_prison.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	6 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S11L1"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S11L2"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S11L3"},
					{"avatar":false,"dialogue":"S11L4"},
					{"avatar":true,"dialogue":"S11L5"},
					{"avatar":false,"dialogue":"S11L6"},
					{"avatar":true,"dialogue":"S11L7"},
					{"avatar":false,"dialogue":"S11L8"},
					{"avatar":true,"dialogue":"S11L9"},
					{"avatar":false,"dialogue":"S11L10"},
					{"choices":{"index":0,
							"S11L10": {
								"next_stage_index": 7,
								"market":"neutral_market1",
								"battle_field":{
									"basic_time": 60,
									"enemy_multiplier":1,
									"battle_music":"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
									"map":"res://asset/map/pr_gs.png",
									"enemy_list" : ["enemy3","enemy4"],
									"fail_stage_index": 44
					}}}}],
				"bg_image": "res://asset/bgim/emperor_cap_invh.png",
				"bg_music": "res://asset/music/stage/Rain.ogg"
			}]
		},
	7 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S12L1"},
						{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S12L2"},
						{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S12L3"},
						{"avatar":false,"dialogue":"S12L4"},
						{"choices":{"index":0,
							"S12L5C1": {
								"next_stage_index": 8
							},
							"S12L5C2": {
								"next_stage_index": 25
							},
							"S12L5C3": {
								"next_stage_index": 46
							},
						}},
						{"avatar":false,"dialogue":"S12L6"}],
				"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png",
				"bg_music": "res://asset/music/stage/Revolve.ogg"
			}]
		},
	8 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S13L1"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/eyes_closed_a.png","dialogue":"S13L2"},
					{"name":"N_SM","avatar":true,"image":"res://asset/avatar/sm2.png","dialogue":"S13L3"},
					{"avatar":false,"dialogue":"S13L4"},
					{"avatar":true,"dialogue":"S13L5","music":"todo"},
					{"avatar":false,"dialogue":"S13L6"},
					{"avatar":true,"dialogue":"S13L7"},
					{"avatar":false,"dialogue":"S13L8"},
					{"avatar":true,"dialogue":"S13L9"},
					{"avatar":false,"dialogue":"S13L10"},
					{"avatar":true,"dialogue":"S13L11"},
					{"rewards": {"index":0,
							"S13L12R1":{"K_CRIT_RATE": 20},
							"S13L12R2":{"K_ACCURACY": 20}
						},
					},
					{"avatar":true,"image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S13L13"},
					{"avatar":true,"dialogue":"S13L14"},
						],
				"bg_image": "res://asset/bgim/ruined_agrzone3.png",
				"bg_music": "res://asset/music/stage/Risel.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S14L1"},
					{"name":"N_SM","avatar":true,"image":"res://asset/avatar/cr.png","dialogue":"S14L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S14L3"},
					{"avatar":false,"dialogue":"S14L4"},
					{"avatar":true,"dialogue":"S14L5"},
					{"avatar":false,"dialogue":"S14L6"},
					{"avatar":true,"dialogue":"S14L7"},
						],
				"bg_image": "res://asset/bgim/imperial_recof.png"
			},
			{"line":[{"avatar":false,"dialogue":"S15L1"},
					{"name":"N_MO","avatar":true,"image":"res://asset/avatar/mo.png","dialogue":"S15L2"},
					{"name":"N_ACM","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S15L3"},
					{"avatar":true,"dialogue":"S15L4"},
					{"avatar":true,"dialogue":"S15L5"},
					{"name":"N_MS","avatar":true,"dialogue":"S15L6"},
					{"name":"N_MO","avatar":true,"dialogue":"S15L7"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","choices":{"index":1,
							"S15L8": {
								"next_stage_index": 8,
								"market":"imperial_market1",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":2,
									"battle_music":"battle/BGM07battle1.wav",
									"map":"res://asset/map/ip_def.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","planet1"],
									"fail_stage_index": 44,
									"special_npc_list" : [{
										"name":"SNPC_ACM",
										"is_ally": true,
										"action_mode":0},{
										"name":"SNPC_ACM",
										"is_ally": true,
										"action_mode":0
									}],
								},
							}}}
						],
				"bg_image": "res://asset/bgim/imperial_deffrt.png"
			}]
		},
	9 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S16L1"},
					{"name":"N_MO","avatar":true,"image":"res://asset/avatar/mo.png","dialogue":"S16L2"},
					{"name":"N_ACM","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S16L3"},
					{"avatar":true,"dialogue":"S16L4"},
					{"avatar":true,"dialogue":"S16L5"},
					{"name":"N_MO","avatar":true,"dialogue":"S16L6"},
					{"name":"N_MS","avatar":true,"dialogue":"S16L7"},
					{"name":"N_MO","avatar":true,"dialogue":"S16L8"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","choices":{"index":0,
							"S16L9": {
								"next_stage_index": 22,
								"market":"imperial_market1",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
									"map":"res://asset/map/al_spl.png",
									"enemy_list" : ["enemy1","enemy2","planet1","planet2"],
									"fail_stage_index": 23,
									"special_npc_list" : [{
										"name":"SNPC_AD",
										"is_ally": false,
										"action_mode":1,#away
										"destroy_stage_index": 10,
									}],
								},
							}}}
						],
				"bg_image": "res://asset/bgim/imperial_deffrt.png",
				"bg_music": "res://asset/music/stage/Sadness.ogg"
			}]},
	10 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S17L1"},
					{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S17L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","dialogue":"S17L3"},
					{"avatar":true,"dialogue":"S17L4"},
					{"avatar":false,"dialogue":"S17L5"},
					{"avatar":true,"dialogue":"S17L6"},
					{"avatar":false,"dialogue":"S17L7"},
					{"avatar":true,"dialogue":"S17L8"},
					{"rewards": {"index":0,
							"S17L9R1":{"K_BOUNTY_GAIN": 2},
							"S17L9R2":{"K_ADD_DMG": 2},
							"S17L9R3":{"K_ARMOR": 2},
							"S17L9R4":{"K_EXP_GAIN": 2}
					}},
					{"avatar":true,"dialogue":"S17L10"},
					{"avatar":false,"dialogue":"S17L11"},
					{"avatar":true,"dialogue":"S17L12"},
					{"avatar":false,"dialogue":"S17L13"},
					{"avatar":true,"dialogue":"S17L14"},
					{"choices":{"index":1,
							"S17L15": {
								"next_stage_index": 11,
								"market":"imperial_market2",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":3,
									"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
									"map":"res://asset/map/ip_def.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","planet1","planet2"],
									"fail_stage_index": 23,
									"special_npc_list" : [{
										"name":"SNPC_ALG",
										"is_ally": false,
										"action_mode":0},{"name":"SNPC_ACM","is_ally": true,"action_mode":0},
										{"name":"SNPC_ACM","is_ally": true,"action_mode":0},
										{"name":"SNPC_ACM","is_ally": true,"action_mode":0}],
								}}}}],
				"bg_image": "res://asset/bgim/imperial_cf_cprr.png",
				"bg_music": "res://asset/music/stage/MemoryBox.ogg"
			}]},
	11 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S18L1"},
					{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S18L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","dialogue":"S18L3"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S18L4"},
					{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S18L5"},
					{"avatar":false,"dialogue":"S18L6"},
					{"avatar":true,"dialogue":"S18L7"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S18L8"},
					{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S18L9"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S18L10"},
					{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S18L11"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S18L12"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","choices":{"index":0,
							"S18L13": {
								"next_stage_index": 12,
								"market":"imperial_market2",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":3,
									"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
									"map":"res://asset/map/ip_def.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","planet1","planet2"],
									"fail_stage_index": 23,
									"special_npc_list" : [{
										"name":"SNPC_ARG",
										"is_ally": false,
										"action_mode":0},{"name":"SNPC_ACM","is_ally": true,"action_mode":0},
										{"name":"SNPC_ACM","is_ally": true,"action_mode":0},
										{"name":"SNPC_ACM","is_ally": true,"action_mode":0}],
					}}}}],
				"bg_image": "res://asset/bgim/imperial_cf_cprr.png",
				"bg_music": "res://asset/music/stage/Soul Of A Winter.ogg"
			}]
		},
	12 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S19L1"},
					{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S19L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S19L3"},
					{"avatar":true,"dialogue":"S19L4"},
					{"avatar":false,"dialogue":"S19L5"},
					{"avatar":true,"dialogue":"S19L6"},
					{"avatar":false,"dialogue":"S19L7"},
					{"avatar":true,"dialogue":"S19L8"},
					{"rewards": {"index":0,
							"S19L9R1":{"K_INTELLIGENCE": 10},
							"S19L9R2":{"K_AFFINITY": 10},
							"S19L9R3":{"K_ELOQUENCY": 10},
							"S19L9R4":{"K_SANITY": 10}
						},
					},
					{"avatar":true,"dialogue":"S19L10"},
					{"avatar":false,"dialogue":"S19L11"},
					{"avatar":true,"dialogue":"S19L12"},
					{"avatar":false,"dialogue":"S19L13"},
					{"avatar":true,"dialogue":"S19L14"},
					{"avatar":false,"dialogue":"S19L15"},
					{"avatar":true,"dialogue":"S19L16"}
					],
				"bg_image": "res://asset/bgim/imperial_cf_cprr.png",
				"bg_music": "res://asset/music/stage/Strange.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S20L0"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S20L1"},
					{"name":"N_AO","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S20L2"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S20L3"},
					{"name":"N_AO","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S20L4"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S20L5"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","dialogue":"S20L6"},
					{"avatar":true,"dialogue":"S20L7"},
					{"avatar":false,"dialogue":"S20L8"},
					{"avatar":true,"dialogue":"S20L9"},
					{"avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_frown.png","dialogue":"S20L10"},
					{"avatar":true,"dialogue":"S20L11"},
					{"choices":{"index":1,
							"S20L12C1": {
								"next_stage_index": 13,
								"market":"imperial_market3",
								"battle_field":{
									"basic_time": 100,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-SilverMoon_loop.ogg",
									"map":"res://asset/map/al_ww.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","planet1","planet2"],
									"fail_stage_index": 23,
									"special_npc_list" : [{
										"name":"SNPC_WW","is_ally": false,"action_mode":0}],
								},
							},
							"S20L12C2": {
								"next_stage_index": 21,
								"market":"super_market",
								"battle_field":{
									"basic_time": 100,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
									"map":"res://asset/map/al_pa.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14",
									"enemy17","enemy18","planet1","planet2","planet4","planet8"],
									"fail_stage_index": 23,
									"special_npc_list" : [{
										"name":"SNPC_PA","is_ally": false,"destroy_stage_index":18,"action_mode":0}],
								}}}},
					{"avatar":true,"dialogue":"S20L13"}
					],
				"bg_image": "res://asset/bgim/1stmtrm.png"
			}]
		},
	13 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S21L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S21L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","dialogue":"S21L3"},
					{"avatar":true,"dialogue":"S21L4"},
					{"choices":{
						"index":0,
						"S18L13": {
							"next_stage_index": 14,
							"market":"imperial_market3",
							"battle_field":{
								"basic_time": 100,
								"enemy_multiplier":3,
								"battle_music":"res://asset/music/battle/War_of_Exploding_Mountains.ogg",
								"map":"res://asset/map/al_ff.png",
								"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","planet1","planet2"],
								"fail_stage_index": 23,
								"special_npc_list" : [{
									"name":"SNPC_FF",
									"is_ally": false,
									"action_mode":0}],
					}}}}],
				"bg_image": "res://asset/bgim/ww_ws.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	14 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S22L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S22L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","dialogue":"S22L3"},
					{"avatar":true,"dialogue":"S22L4"},
					{"choices":{
						"index":0,
						"S22L15": {
							"next_stage_index": 15,
							"market":"imperial_market3",
							"battle_field":{
								"basic_time": 100,
								"enemy_multiplier":3,
								"battle_music":"res://asset/music/battle/Battle-Conflict_loop.ogg",
								"map":"res://asset/map/al_fh.png",
								"enemy_list" : ["enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet2","planet4"],
								"fail_stage_index": 23,
								"special_npc_list" : [{
									"name":"SNPC_FH",
									"is_ally": false,
									"action_mode":0},{"name":"SNPC_ACM2","is_ally": true,"action_mode":0}],
			}}}}],
				"bg_image": "res://asset/bgim/ff_esply.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	15 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S23L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S23L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smile.png","dialogue":"S23L3"},
					{"avatar":true,"dialogue":"S23L4"},
					{"avatar":false,"dialogue":"S23L5"},
					{"avatar":true,"dialogue":"S23L6"},
					{"choices":{
						"index":0,
						"S22L15": {
							"next_stage_index": 16,
							"market":"super_market",
							"battle_field":{
								"basic_time": 100,
								"enemy_multiplier":3,
								"battle_music":"res://asset/music/battle/Battle-SilverMoon_loop.ogg",
								"map":"res://asset/map/al_cs.png",
								"enemy_list" : ["enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet2","planet4"],
								"fail_stage_index": 23,
								"special_npc_list" : [{
									"name":"SNPC_CS",
									"is_ally": false,
									"action_mode":0},{"name":"SNPC_ACM2","is_ally": true,"action_mode":0}],
							},
						}}}],
				"bg_image": "res://asset/bgim/forgeharbor.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	16 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S24L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S24L2"},
					{"rewards": {"index":0,
						"S24L3R1":{"K_AFFINITY": 10, "K_ELOQUENCY": 10},
						"S24L3R2":{"K_SANITY": -10, "K_ADD_DMG":20}
							}},
					{"avatar":true,"dialogue":"S24L4"},
					{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mutated/mouth_frown.png","dialogue":"S24L5"},
					{"avatar":true,"dialogue":"S24L6"},
					{"avatar":false,"dialogue":"S24L7"},
					{"avatar":true,"dialogue":"S24L8"},
					{"avatar":false,"dialogue":"S24L9"},
					{"avatar":true,"dialogue":"S24L10"},
					{"choices":{
						"index":1,
						"S24L11": {
							"next_stage_index": 17,
							"market":"super_market",
							"battle_field":{
								"basic_time": 100,
								"enemy_multiplier":3,
								"battle_music":"res://asset/music/battle/Battle-Grief_loop.ogg",
								"map":"res://asset/map/al_hp.png",
								"enemy_list" : ["enemy9","enemy10","enemy13","enemy14","enemy17","enemy18","planet2","planet4","planet8"],
								"fail_stage_index": 23,
								"special_npc_list" : [{
									"name":"SNPC_HP",
									"is_ally": false,
									"action_mode":0},{"name":"SNPC_ACM2","is_ally": true,"action_mode":0},{"name":"SNPC_ACM2","is_ally": true,"action_mode":0}],
							}}}}
					],
				"bg_image": "res://asset/bgim/crystalsky.png",
				"bg_music": "res://asset/music/stage/Red Clouds.ogg"
			}]
		},
	17 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S25L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S25L2"},
					{"name":"N_AO","avatar":true,"image":"res://asset/main_character/IC/mutated/npc.png","dialogue":"S25L3"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S25L4"},
					{"choices":{
						"index":0,
						"S24L11": {
							"next_stage_index": 18,
							"market":"super_market",
							"battle_field":{
								"basic_time": 120,
								"enemy_multiplier":3,
								"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
								"map":"res://asset/map/al_pa.png",
								"enemy_list" : ["enemy9","enemy10","enemy13","enemy14","enemy17","enemy18","planet2","planet4","planet8"],
								"fail_stage_index": 23,
								"special_npc_list" : [{
									"name":"SNPC_PA",
									"is_ally": false,
									"action_mode":0},
									{"name":"SNPC_ACM2","is_ally": true,"action_mode":0},
									{"name":"SNPC_ACM2","is_ally": true,"action_mode":0},
									{"name":"SNPC_ACM2","is_ally": true,"action_mode":0}],
							}}}}
					],
				"bg_image": "res://asset/bgim/1stmtrm.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	18 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S26L1"},
					{"name":"N_LO","avatar":true,"image":"res://asset/avatar/lo.png","dialogue":"S26L2"},
					{"choices":{
						"index":0,
						"S26L3C1": {
								"next_stage_index": 20
							},
						"S26L3C2": {
							"next_stage_index": 19,
							"req":{"K_INTELLIGENCE": 30,"K_SANITY":30},
							"battle_field":{
								"basic_time": 60,
								"enemy_multiplier":5,
								"battle_music":"res://asset/music/battle/BGM07battle2.wav",
								"map":"res://asset/map/al_ts.png",
								"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy13","enemy14",
								"enemy17","enemy18","planet1","planet2","planet4","planet8"],
								"fail_stage_index": 23
							}}}}
					],
				"bg_image": "res://asset/bgim/pa_frtbf.png",
				"bg_music": "res://asset/music/stage/Uplifter.ogg"
			}]
		},
	19 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S27L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S27L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smirk.png","dialogue":"S27L3"},
					{"avatar":true,"dialogue":"S27L4"},
					{"avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_frown.png","dialogue":"S27L5"},
					{"avatar":true,"dialogue":"S27L6"},
					{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S27L7"},
					{"avatar":false,"dialogue":"S27L8"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S27L9"},
					{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S27L10"},
					{"avatar":false,"dialogue":"S27L11"},
					],
				"bg_image": "res://asset/bgim/pa_coc.png",
				"bg_music": "res://asset/music/stage/Midnight Shadow.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S28L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S28L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_smirk.png","dialogue":"S28L3"},
					{"name":"N_AO","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S28L4"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S28L5"},
					{"avatar":false,"dialogue":"S28L6"}
					],
				"bg_image": "res://asset/bgim/pa_chmc.png",
				"bg_music": "res://asset/music/stage/Shamisen Samurai Rock.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S29L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S29L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S29L3"},
					{"avatar":true,"dialogue":"S29L4"},
					{"avatar":false,"dialogue":"S29L5"},
					{"avatar":true,"dialogue":"S29L6"},
					{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S29L7"},
					{"avatar":false,"dialogue":"S29L8"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S29L9"},
					{"avatar":false,"dialogue":"S29L10"},
					{"avatar":true,"dialogue":"S29L11"},
					{"avatar":false,"dialogue":"S29L12"}],
				"bg_image": "res://asset/bgim/pa_ggpmr.png",
				"bg_music": "res://asset/music/stage/InLoneliness.ogg"
			},],
		"end_stage": "PDEVIL"
		},
	20 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S30L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S30L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S30L3"},
					{"avatar":true,"dialogue":"S30L4"},
					{"avatar":false,"dialogue":"S30L5"},{"avatar":true,"dialogue":"S30L6"}],
				"bg_image": "res://asset/bgim/pa_chmc.png",
				"bg_music": "res://asset/music/stage/Shamisen Samurai Rock.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S31L1"},
					{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S31L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S31L3"},
					{"avatar":true,"dialogue":"S31L4"},
					{"avatar":false,"dialogue":"S31L5"},{"avatar":true,"dialogue":"S31L6"},
					{"avatar":false,"dialogue":"S31L7"},{"avatar":true,"dialogue":"S31L8"},
					{"avatar":false,"dialogue":"S31L9"},{"avatar":true,"dialogue":"S31L10"},
					{"avatar":false,"dialogue":"S31L11"}],
				"bg_image": "res://asset/bgim/pa_ggpmr.png",
				"bg_music": "res://asset/music/stage/InLoneliness.ogg"
			}],
		"end_stage": "NCHARIOT"
		},
	21 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S32L1"},
					{"name":"N_CJ","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S32L2"},
					{"name":"N_PS","avatar":true,"dialogue":"S32L3"},
					{"name":"N_CJ","avatar":true,"dialogue":"S32L4"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mutated/mouth_frown.png","dialogue":"S32L5"},
					{"name":"N_PS","avatar":true,"dialogue":"S32L6"},
					{"avatar":false,"dialogue":"S32L7"},
					{"avatar":true,"dialogue":"S32L8"},
					{"avatar":false,"dialogue":"S32L9"},
					{"avatar":true,"dialogue":"S32L10"},
					{"avatar":false,"dialogue":"S32L11"},
					{"avatar":true,"dialogue":"S32L12"},
					{"name":"N_CJ","avatar":true,"dialogue":"S32L13"},
					{"avatar":false,"dialogue":"S32L14"},
					{"avatar":true,"dialogue":"S32L15"},
					{"avatar":false,"image":"res://asset/main_character/IC/mutated/eyes_closed.png","dialogue":"S32L16"},
					],
				"bg_image": "res://asset/bgim/pa_ts.png",
				"bg_music": "res://asset/music/stage/Uplifter.ogg"
			}],
			"end_stage": "NJUDGEMENT"
		},
	22 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S33L1"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/mutated/mouth_frown_a.png","dialogue":"S33L2"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/smile.png","dialogue":"S33L3"},
					{"avatar":true,"image":"res://asset/main_character/IC/mutated/mouth_smirk_a.png","dialogue":"S33L4"},
					{"avatar":false,"image":"res://asset/main_character/AD/surprised_open_mouth.png","dialogue":"S33L5"},
					{"avatar":true,"dialogue":"S33L6"},
					{"avatar":false,"dialogue":"S33L7"},
					{"avatar":true,"image":"res://asset/main_character/IC/mutated/mouth_smile_a.png","dialogue":"S33L8"},
					{"avatar":false,"image":"res://asset/main_character/AD/grin_blush.png","dialogue":"S33L9"},
					{"avatar":true,"dialogue":"S33L10"},
					{"avatar":false,"dialogue":"S33L11"},
					{"avatar":true,"dialogue":"S33L12"},
					{"avatar":false,"dialogue":"S33L13"},
					{"avatar":true,"dialogue":"S33L14"},
					{"avatar":false,"dialogue":"S33L15"},
					{"avatar":true,"dialogue":"S33L16"},
					{"avatar":false,"dialogue":"S33L17"},
					{"avatar":true,"dialogue":"S33L18"},
					{"avatar":false,"dialogue":"S33L19"},
					{"avatar":true,"image":"res://asset/main_character/IC/mutated/eyes_closed_a.png","dialogue":"S33L20"},
					{"avatar":false,"image":"res://asset/main_character/AD/shy.png","dialogue":"S33L21"},
					{"choices":{"index":0,
							"S33L22C1": {
								"next_stage_index": 26
							},
							"S33L22C2": {
								"next_stage_index": 60
							}}},
					{"avatar":false,"dialogue":"S33L23"},
					{"avatar":true,"dialogue":"S33L24"},
					{"avatar":false,"dialogue":"S33L25"},
					{"choices":{"index":1,
							"S33L26": {
								"market":"neutral_market1",
								"battle_field":{
									"basic_time": 40,
									"enemy_multiplier":3,
									"battle_music":"res://asset/music/battle/BGM07battle3.wav",
									"map":"res://asset/map/al_spl.png",
									"enemy_list" : ["enemy3","enemy4","planet1","planet3"],
									"fail_stage_index": 23,
				}}}}],
				"bg_image": "res://asset/bgim/al_spl.png",
				"bg_music": "res://asset/music/stage/The Light.ogg"
			}]},
	23 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S34L1"}],
				"bg_image": "res://asset/bgim/ntower.png",
				"bg_music": "res://asset/music/stage/InLoneliness.ogg"
			}],
			"end_stage": "NTOWER"
		},
	24 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S35L1"},
					{"name":"N_AD","avatar":true,"image":"res://asset/main_character/AD/shy_a.png","dialogue":"S35L2"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S35L3"},
					{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S35L4"},
					{"avatar":false,"dialogue":"S35L5"},
					{"avatar":true,"dialogue":"S35L6"},
					{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S35L7"},
					{"avatar":true,"dialogue":"S35L8"},
					{"avatar":false,"dialogue":"S35L9"}],
				"bg_image": "res://asset/bgim/imperial_pcon.png",
				"bg_music": "res://asset/music/stage/Strange.ogg"
			}],
			"end_stage": "NLOVERS"
		},
	25 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S36L1"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/smile.png","dialogue":"S36L2"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/mouth_smile_a.png","dialogue":"S36L3"},
					{"avatar":false,"dialogue":"S36L4"},
					{"avatar":true,"image":"res://asset/main_character/IC/eyes_closed_a.png","dialogue":"S36L5"},
					{"avatar":false,"dialogue":"S36L6"},
					{"avatar":true,"dialogue":"S36L7"},
					{"avatar":false,"dialogue":"S36L8"},
					{"avatar":true,"dialogue":"S36L9"},
					{"avatar":false,"dialogue":"S36L10"},
					{"avatar":true,"image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S36L11"},
					{"avatar":false,"dialogue":"S36L12"}],
				"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png",
				"bg_music": "res://asset/music/stage/The Light.ogg"
			}],
			"next_stage_index" :26
		},
	26 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S37L1"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/smile.png","dialogue":"S37L2"},
					{"name":"N_DLY","avatar":true,"image":"res://asset/avatar/dly.png","dialogue":"S37L3"},
					{"name":"N_AT","avatar":true,"image":"res://asset/avatar/at.png","dialogue":"S37L4"},
					{"name":"N_CT","avatar":true,"image":"res://asset/avatar/ct.png","dialogue":"S37L5"},
					{"name":"N_RC","avatar":true,"image":"res://asset/avatar/rc.png","dialogue":"S37L6"},
					{"name":"N_JW","avatar":true,"image":"res://asset/avatar/jw.png","dialogue":"S37L7"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S37L8"},
					{"avatar":true,"dialogue":"S37L9"},
					{"avatar":false,"dialogue":"S37L10"},
					{"avatar":true,"dialogue":"S37L11"},
					{"avatar":false,"dialogue":"S37L12"},
					{"avatar":true,"dialogue":"S37L13"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/shy_blush.png","dialogue":"S37L14"},
					{"avatar":true,"dialogue":"S37L15"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","choices":{"index":0,
							"S37L16C1": {
								"next_stage_index": 27,
								"req":{"K_AFFINITY": 20},
							},
							"S37L16C2": {
								"next_stage_index": 30
							},
							"S37L16C3": {
								"next_stage_index": 45
							}
						}},
					{"avatar":true,"dialogue":"S37L17"},
					],
				"bg_image": "res://asset/bgim/2ndbtcf.png",
				"bg_music": "res://asset/music/stage/Sand.ogg"
			}]
		},
	27 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S38L1"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S38L2"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S38L3"},
					{"avatar":false,"dialogue":"S38L4"},
					{"avatar":true,"dialogue":"S38L5"},
					{"avatar":false,"dialogue":"S38L6"},
					{"avatar":true,"dialogue":"S38L7"},
					{"avatar":false,"dialogue":"S38L8"},
					{"avatar":true,"dialogue":"S38L9"},
					{"avatar":false,"dialogue":"S38L10"},
					{"avatar":true,"dialogue":"S38L11"},
					{"avatar":false,"dialogue":"S38L12"},
					{"avatar":true,"dialogue":"S38L13"},
					{"avatar":false,"dialogue":"S38L14"},
					{"avatar":true,"dialogue":"S38L15"},
					{"avatar":false,"dialogue":"S38L16"},
					{"choices":{"index":0,
							"S38L17": {
								"next_stage_index": 28,
								"market":"alliance_market1",
								"battle_field":{
									"basic_time": 60,
									"enemy_multiplier":3,
									"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
									"map":"res://asset/map/al_spl.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","planet2"],
									"special_npc_list" : [
									{"name":"SNPC_AD","is_ally": true,"action_mode":0,
									"destroy_stage_index":29}],
									"fail_stage_index": 23,
							}}}},
					],
				"bg_image": "res://asset/bgim/al_spl.png",
				"bg_music": "res://asset/music/stage/Well-knownToMyHeart.ogg"
			}]
		},
	28 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S39L1"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S39L2"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S39L3"},
					{"avatar":false,"dialogue":"S39L4"},
					{"avatar":true,"dialogue":"S39L5"},
					{"avatar":false,"dialogue":"S39L6"},
					{"avatar":true,"dialogue":"S39L7"},
					{"avatar":false,"dialogue":"S39L8"},
					{"avatar":true,"dialogue":"S39L9"},
					{"avatar":false,"dialogue":"S39L10"},
					{"avatar":true,"dialogue":"S39L11"},
					{"avatar":false,"dialogue":"S39L12"},
					{"choices":{"index":0,
							"S39L13C1": {
								"next_stage_index": 60
							},
							"S39L13C2": {
								"next_stage_index": 30
							}
						}},
					{"avatar":false,"dialogue":"S39L14"}],
				"bg_image": "res://asset/bgim/al_spl.png",
				"bg_music": "res://asset/music/stage/Well-knownToMyHeart.ogg"
			}]
		},
	29 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S40L1"},
					{"name":"N_GC","avatar":true,"image":"res://asset/avatar/gc.png","dialogue":"S40L2"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/shy_blush.png","dialogue":"S40L3"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S40L4"},
					{"avatar":false,"dialogue":"S40L5"},
					{"avatar":true,"dialogue":"S40L6"},
					{"avatar":false,"dialogue":"S40L7"},
					{"avatar":true,"dialogue":"S40L8"},
					{"avatar":false,"dialogue":"S40L9"},
					{"avatar":true,"dialogue":"S40L10"},
					],
				"bg_image": "res://asset/bgim/al_spl.png",
				"bg_music": "res://asset/music/stage/Sadness.ogg"}],
			"next_stage_index": 46
		},
	30 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S41L1"},
					{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S41L2"},
					{"name":"N_ACS","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S41L3"},
					{"avatar":true,"dialogue":"S41L4"},
					{"name":"N_ACS","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S41L5"},
					{"name":"N_SS","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S41L6"},
					{"avatar":false,"image":"res://asset/main_character/AD/shy_blush.png","dialogue":"S41L7"},
					{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S41L8"},
					{"avatar":false,"image":"res://asset/main_character/AD/grin_blush.png","dialogue":"S41L9"},
					{"choices":{"index":0,
							"S41L10": {
								"next_stage_index": 31,
								"market":"alliance_market1",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":4,
									"battle_music":"res://asset/music/battle/BGM07battle4.wav",
									"map":"res://asset/map/ip_def.png",
									"enemy_list" : ["enemy3","enemy4","planet2"],
									"fail_stage_index": 23
								}}}}],
				"bg_image": "res://asset/bgim/al_spmtc.png",
				"bg_music": "res://asset/music/stage/MemoryBox.ogg"
			}],
		},
	31 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S42L1"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S42L2"},
					{"name":"N_SS","avatar":true,"dialogue":"S42L3"},
					{"choices":{"index":0,
							"S42L4": {
								"next_stage_index": 32,
								"market":"alliance_market1",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":1,
									"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
									"map":"res://asset/map/ip_def2.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","planet2","planet3"],
									"special_npc_list" : [
									{"name":"SNPC_ILG","is_ally": false,"action_mode":0},
									{"name":"SNPC_ACS","is_ally": true,"action_mode":0},
									{"name":"SNPC_ACS","is_ally": true,"action_mode":0},
									{"name":"SNPC_AD","is_ally": true,"action_mode":0}],
									"fail_stage_index": 23,
								},
						}}},
					],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	32 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S43L1"},
					{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S43L2"},
					{"name":"N_SS","avatar":true,"dialogue":"S42L3"},
					{"choices":{"index":0,
							"S42L4": {
								"next_stage_index": 33,
								"market":"alliance_market2",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":1,
									"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
									"map":"res://asset/map/ip_def2.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","enemy11","planet1","planet4"],
									"special_npc_list" : [
									{"name":"SNPC_IRG","is_ally": false,"action_mode":0},
									{"name":"SNPC_ACS","is_ally": true,"action_mode":0},
									{"name":"SNPC_ACS","is_ally": true,"action_mode":0},
									{"name":"SNPC_AD","is_ally": true,"action_mode":0}],
									"fail_stage_index": 23,
								},
						}}},],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	33 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S44L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S44L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S44L3"},
				{"avatar":false,"dialogue":"S44L4"},
				{"avatar":true,"dialogue":"S44L5"},
				{"avatar":false,"dialogue":"S44L6"},
				{"avatar":true,"dialogue":"S44L7"},
				{"avatar":false,"dialogue":"S44L8"},
				{"avatar":true,"dialogue":"S44L9"},
				{"avatar":false,"dialogue":"S44L10"},
				{"avatar":true,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S44L11"},
				{"avatar":false,"image":"res://asset/main_character/AD/grin.png","dialogue":"S44L12"},
				{"avatar":true,"dialogue":"S44L13"},
				{"avatar":false,"dialogue":"S44L14"},
				{"rewards": {"index":0,
							"S44L15R1":{"K_SANITY": 15},
							"S44L15R2":{"K_INTELLIGENCE": 15},
							"S44L15R3":{"K_ELOQUENCY": 15},
							"S44L15R4":{"K_AFFINITY": 15}
						}},
				{"avatar":false,"dialogue":"S44L16"},
				{"choices":{"index":1,
							"S44L17": {
								"next_stage_index": 34,
								"market":"alliance_market2",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":4,
									"battle_music":"res://asset/music/battle/Track4.ogg",
									"map":"res://asset/map/ip_def3.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet3","planet5","planet6"],
									"fail_stage_index": 23
				}}}}],
				"bg_image": "res://asset/bgim/al_bhfcprr.png",
				"bg_music": "res://asset/music/stage/Dream Sakura.ogg"
			}]
		},
	34 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S45L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S45L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S45L3"},
				{"avatar":false,"dialogue":"S45L4"},
				{"choices":{"index":0,
							"S45L5": {
								"next_stage_index": 35,
								"market":"alliance_market2",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":4,
									"battle_music":"res://asset/music/battle/Track6_Bonus1.ogg",
									"map":"res://asset/map/ip_def3.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet3","planet5","planet6"],
									"fail_stage_index": 23
				}}}}],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/Shinning Darkness.ogg"
			}]
		},
	35 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S46L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S46L2"},
				{"choices":{"index":0,
							"S46L3": {
								"next_stage_index": 36,
								"market":"alliance_market3",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":4,
									"battle_music":"res://asset/music/battle/Track7_Bonus2.ogg",
									"map":"res://asset/map/ip_def3.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet3","planet5","planet6"],
									"fail_stage_index": 23
				}}}}],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	36 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S47L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S47L2"},
				{"name":"N_GC","avatar":true,"image":"res://asset/avatar/gc.png","dialogue":"S47L3"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S47L4"},
				{"name":"N_GC","avatar":true,"image":"res://asset/avatar/gc.png","dialogue":"S47L5"},
				{"rewards": {"index":0,
							"S47L6R1":{"K_INTELLIGENCE": 5},
							"S47L6R2":{"K_ELOQUENCY": 5}
						}},
				{"name":"N_GC","avatar":true,"image":"res://asset/avatar/gc.png","dialogue":"S47L7"},
				{"choices":{"index":1,
					"S47L8": {
						"next_stage_index": 37,
						"market":"alliance_market3",
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Battle-Furious-GUITAR_loop.ogg",
							"map":"res://asset/map/ip_zjy.png",
							"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17",
								"planet5","planet6","planet7","planet9"],
							"special_npc_list" : [{
								"name":"SNPC_ZJY",
								"is_ally": false,
								"action_mode":0
							}],
							"fail_stage_index": 23
				}}}}],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	37 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S48L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/shy.png","dialogue":"S48L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S48L3"},
				{"avatar":false,"dialogue":"S48L4"},
				{"avatar":true,"dialogue":"S48L5"},
				{"avatar":false,"dialogue":"S48L6"},
				{"avatar":true,"dialogue":"S48L7"},
				{"avatar":false,"dialogue":"S48L8"},
				{"avatar":true,"dialogue":"S48L9"},
				{"avatar":false,"dialogue":"S48L10"},
				{"avatar":true,"dialogue":"S48L11"},
				{"avatar":false,"dialogue":"S48L12"},
				{"choices":{"index":0,
					"S48L13": {
						"next_stage_index": 38,
						"market":"super_market",
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Battle-Grief_loop.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17","enemy18",
								"planet5","planet6","planet7","planet9"],
							"special_npc_list" : [{
								"name":"SNPC_ZTB",
								"is_ally": false,
								"action_mode":0
							}],
							"fail_stage_index": 23
				}}}}],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/Warfare.ogg"
			}]
		},
	38 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S49L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/shy.png","dialogue":"S49L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S49L3"},
				{"avatar":false,"dialogue":"S49L4"},
				{"avatar":true,"dialogue":"S49L5"},
				{"rewards": {"index":0,
							"S49L6R1":{"K_ACCURACY":40},
							"S49L6R2":{"K_CRIT_RATE":40},
							"S49L6R3":{"K_INTELLIGENCE": 15,"K_SANITY": 15}
						}},
				{"avatar":true,"dialogue":"S49L7"},
				{"choices":{"index":1,
					"S49L8": {
						"next_stage_index": 39,
						"market":"super_market",
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
							"map":"res://asset/map/ip_emp.png",
							"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17","enemy18",
								"planet5","planet6","planet7","planet9"],
							"special_npc_list" : [{
								"name":"SNPC_EMP",
								"is_ally": false,
								"action_mode":0
							}],
							"fail_stage_index": 23
				}}}}],
				"bg_image": "res://asset/bgim/al_bhfc.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	39 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S50L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S50L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S50L3"},
				{"avatar":false,"dialogue":"S50L4"},
				{"avatar":true,"dialogue":"S50L5"},
				{"avatar":false,"dialogue":"S50L6"},
				{"avatar":true,"dialogue":"S50L7"},
				{"avatar":false,"dialogue":"S50L8"}],
				"bg_image": "res://asset/bgim/emperor_capital.png",
				"bg_music": "res://asset/music/stage/Dream Sakura.ogg"},
			{"line":[{"avatar":false,"dialogue":"S51L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S51L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S51L3"},
				{"avatar":false,"dialogue":"S51L4"},
				{"avatar":true,"dialogue":"S51L5"},
				{"avatar":false,"dialogue":"S51L6"},
				{"avatar":true,"dialogue":"S51L7"},
				{"avatar":false,"dialogue":"S51L8"}],
				"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png"}],
			"next_stage_index": 40,
		},
	40 : {"scenario_list" :
			[{"line":[{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S52L1"},
				{"name":"N_JW","avatar":true,"image":"res://asset/avatar/jw.png","dialogue":"S52L2"},
				{"avatar":true,"dialogue":"S52L3"},
				{"avatar":true,"dialogue":"S52L4"},
				{"name":"N_ADS","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S52L5"},
				{"avatar":false,"dialogue":"S52L6"},
				{"avatar":true,"dialogue":"S52L5"}],
				"bg_image": "res://asset/bgim/al_pacc.png",
				"bg_music": "res://asset/music/stage/Shamisen Samurai Rock.ogg"},
			{"line":[{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S53L1"},
				{"name":"N_JW","avatar":true,"image":"res://asset/avatar/jw.png","dialogue":"S53L2"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S53L3"},
				{"avatar":true,"dialogue":"S53L4"},
				{"avatar":false,"dialogue":"S53L5"},
				{"avatar":true,"dialogue":"S53L6"},
				{"avatar":false,"dialogue":"S53L7"},
				{"avatar":true,"dialogue":"S53L8"},
				{"choices":{"index":0,
							"S53L9C1": {"next_stage_index": 41},
							"S53L9C2": {"next_stage_index": 42}}},
				{"avatar":false,"dialogue":"S53L10"},
				{"avatar":true,"dialogue":"S53L11"},
				],
				"bg_image": "res://asset/bgim/pa_chmc.png",
				"bg_music": "res://asset/music/stage/InLoneliness.ogg"}]
		},
	41 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S54L1"}],
				"bg_image": "res://asset/bgim/al_nhermit_end.png",
				"bg_music": "res://asset/music/stage/Ancient Woods.ogg"
			}],
			"end_stage": "NHERMIT"
		},
	42 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S55L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/base.png","dialogue":"S55L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S55L3"},
				{"avatar":false,"dialogue":"S55L4"},
				{"avatar":true,"dialogue":"S55L5"},
				{"avatar":false,"dialogue":"S55L6"},
				{"choices":{"index":0,
				"S55L7": {"next_stage_index": 43,
					"battle_field":{
						"basic_time": 120,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
						"map":"res://asset/map/al_pa.png",
						"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14",
						"enemy17","enemy18","planet1","planet2","planet4","planet8"],
						"fail_stage_index": 44,
						"special_npc_list" : [{
							"name":"SNPC_PA","is_ally": false,"action_mode":0}]}}}}
				],
				"bg_image": "res://asset/bgim/ww_ws.png",
				"bg_music": "res://asset/music/stage/Birds Fly.ogg"
			}],
		},
	43 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S56L1"},
				{"name":"N_AD","avatar":false,"image":"res://asset/main_character/AD/shy.png","dialogue":"S56L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/base.png","dialogue":"S56L3"},
				{"avatar":false,"dialogue":"S56L4"},
				{"avatar":true,"dialogue":"S56L5"},
				{"avatar":false,"image":"res://asset/main_character/AD/smile_open_mouth_blush.png","dialogue":"S56L6"},
				{"avatar":true,"dialogue":"S56L7"},
				{"avatar":false,"dialogue":"S56L8"}
				],
				"bg_image": "res://asset/bgim/ww_ws.png",
				"bg_music": "res://asset/music/stage/Dream Sakura.ogg"
			}],
			"end_stage": "PLOVERS"
		},
	44 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S57L1"}],
				"bg_image": "res://asset/bgim/nstar.png",
				"bg_music": "res://asset/music/stage/Bright Stars.ogg"
			}],
			"end_stage": "NSTAR"
		},
	45 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S58L1"}],
				"bg_image": "res://asset/bgim/nhermit.png",
				"bg_music": "res://asset/music/stage/Ancient Woods.ogg"
			}],
			"end_stage": "NHERMIT"
		},
	46 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S59L1"},
				{"avatar":false,"dialogue":"S59L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S59L3"},
				{"avatar":true,"dialogue":"S59L4"},
				{"avatar":true,"dialogue":"S59L5"},
				{"avatar":true,"dialogue":"S59L6"},
				{"avatar":true,"dialogue":"S59L7"},
				{"avatar":true,"dialogue":"S59L8"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S59L9"},
				{"choices":{"index":0,
							"S59L10C1": {
								"req":{"K_INTELLIGENCE": 50,"K_SANITY": 50},
								"next_stage_index": 47,
								"market":"neutral_market1",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
									"map":"res://asset/map/ip_def.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","planet3"],
									"fail_stage_index": 44
								}},
							"S59L10C2": {
								"next_stage_index": 60
							}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Return.ogg"
			}]
		},
	47 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S60L1"},
				{"avatar":false,"dialogue":"S60L2"},
				{"choices":{"index":0,
							"S60L3": {
								"next_stage_index": 48,
								"market":"neutral_market1",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/BGM07battle1.wav",
									"map":"res://asset/map/al_spl.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","planet1","planet2"],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Return.ogg"
			}]
		},
	48 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S61L1"},
				{"avatar":false,"dialogue":"S61L2"},
				{"choices":{"index":0,
							"S61L3": {
								"next_stage_index": 49,
								"market":"neutral_market2",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":3,
									"battle_music":"res://asset/music/battle/BGM07battle2.wav",
									"map":"res://asset/map/ip_def2.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","planet3"],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Return.ogg"
			}]
		},
	49 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S62L1"},
				{"avatar":false,"dialogue":"S62L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S62L3"},
				{"avatar":true,"dialogue":"S62L4"},
				{"avatar":true,"dialogue":"S62L5"},
				{"choices":{"index":0,
							"S62L6": {
								"next_stage_index": 50,
								"market":"neutral_market2",
								"battle_field":{
									"basic_time": 80,
									"enemy_multiplier":3,
									"battle_music":"res://asset/music/battle/BGM07battle3.wav",
									"map":"res://asset/map/al_fh.png",
									"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","planet2","planet5"],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Drunken Captain.ogg"
			}]
		},
	50 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S63L1"},
				{"avatar":false,"dialogue":"S63L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S63L3"},
				{"avatar":true,"dialogue":"S63L4"},
				{"avatar":true,"dialogue":"S63L5"},
				{"choices":{"index":0,
							"S63L6": {
								"next_stage_index": 51,
								"market":"neutral_market3",
								"battle_field":{
									"basic_time": 100,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
									"map":"res://asset/map/ip_def3.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","enemy11","planet3","planet4"],
									"special_npc_list" : [
									{"name":"SNPC_ILG","is_ally": false,"action_mode":0},
									{"name":"SNPC_IRG","is_ally": false,"action_mode":0}],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Drunken Captain.ogg"
			}]
		},
	51 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S64L1"},
				{"avatar":false,"dialogue":"S64L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S64L3"},
				{"avatar":true,"dialogue":"S64L4"},
				{"avatar":true,"dialogue":"S64L5"},
				{"choices":{"index":0,
							"S64L6": {
								"next_stage_index": 52,
								"market":"neutral_market3",
								"battle_field":{
									"basic_time": 100,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
									"map":"res://asset/map/al_cs.png",
									"enemy_list" : ["enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet4","planet8"],
									"special_npc_list" : [
									{"name":"SNPC_ALG","is_ally": false,"action_mode":0},
									{"name":"SNPC_ARG","is_ally": false,"action_mode":0}],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	52 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S65L1"},
				{"avatar":false,"dialogue":"S65L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S65L3"},
				{"avatar":true,"dialogue":"S65L4"},
				{"avatar":true,"dialogue":"S65L5"},
				{"choices":{"index":0,
							"S65L6": {
								"next_stage_index": 53,
								"market":"super_market",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-Furious-GUITAR_loop.ogg",
									"map":"res://asset/map/ip_zjy.png",
									"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8",
									"enemy9","enemy10","enemy11","enemy12","enemy13","enemy14","planet1","planet2","planet3","planet4"],
									"special_npc_list" : [
									{"name":"SNPC_ZJY","is_ally": false,"action_mode":0},
									{"name":"SNPC_FF","is_ally": false,"action_mode":0},
									{"name":"SNPC_FH","is_ally": false,"action_mode":0}],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	53 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S66L1"},
				{"avatar":false,"dialogue":"S66L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S66L3"},
				{"avatar":true,"dialogue":"S66L4"},
				{"avatar":true,"dialogue":"S66L5"},
				{"choices":{"index":0,
							"S66L6": {
								"next_stage_index": 54,
								"market":"super_market",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-Grief_loop.ogg",
									"map":"res://asset/map/ip_hp.png",
									"enemy_list" : ["enemy3","enemy4","enemy5","enemy6","enemy7","enemy8","enemy9","enemy10",
									"enemy11","enemy12","enemy13","enemy14","enemy15","enemy16","planet3","planet4","planet5","planet6"],
									"special_npc_list" : [
									{"name":"SNPC_ZTB","is_ally": false,"action_mode":0},
									{"name":"SNPC_CS","is_ally": false,"action_mode":0},
									{"name":"SNPC_HP","is_ally": false,"action_mode":0}],
									"fail_stage_index": 44
				}}}},
				{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S66L7"},
				{"avatar":false,"dialogue":"S66L8"}
				],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	54 : {"scenario_list" :
			[{"line":[{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S67L1"},
				{"avatar":false,"dialogue":"S67L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S67L3"},
				{"avatar":true,"dialogue":"S67L4"},
				{"avatar":true,"dialogue":"S67L5"},
				{"choices":{"index":0,
							"S67L6": {
								"next_stage_index": 55,
								"market":"super_market",
								"battle_field":{
									"basic_time": 240,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
									"map":"res://asset/map/al_pa.png",
									"enemy_list" : ["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12",
									"enemy13","enemy14","enemy15","enemy16","enemy17","enemy18","planet7","planet8","planet9"],
									"special_npc_list" : [
									{"name":"SNPC_PA","is_ally": false,"action_mode":0},
									{"name":"SNPC_EMP","is_ally": false,"action_mode":0}],
									"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	55 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S68L1"},
				{"avatar":false,"dialogue":"S68L2"},
				{"avatar":true,"name":"N_ACD","image":"res://asset/avatar/npc.png","dialogue":"S68L3"},
				{"avatar":true,"dialogue":"S68L4"},
				{"avatar":true,"dialogue":"S68L5"}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Death Star.ogg"
			}],
		"end_stage": "PDEATH"
		},
	56 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S69L1"},
				{"avatar":true,"name":"N_XZ","image":"res://asset/avatar/xz.png","dialogue":"S69L2"},
				{"choices":{"index":0,
					"S69L3C1": {
						"next_stage_index": 58
					},
					"S69L3C2": {
						"next_stage_index": 57
				}}}
				],
				"bg_image": "res://asset/bgim/bt_pr_gs.png",
				"bg_music": "res://asset/music/stage/Strange.ogg"
			}]
		},
	57 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S70L1"},
				{"avatar":true,"name":"N_CMRN","image":"res://asset/avatar/cmrn.png","dialogue":"S70L2"},
				{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S70L3"},
				{"avatar":false,"dialogue":"S70L4"},
				],
				"bg_image": "res://asset/bgim/emperor_capital.png",
				"bg_music": "res://asset/music/stage/InExtremis.ogg"
			}],
			"end_stage": "NHANGMAN"
		},
	58 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S71L1"},
				{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S71L2"},
				{"avatar":true,"name":"N_SM","image":"res://asset/avatar/sm.png","dialogue":"S71L3"},
				{"avatar":false,"dialogue":"S71L4"},
				{"avatar":true,"dialogue":"S71L5"},
				{"avatar":false,"dialogue":"S71L6"},
				{"avatar":true,"name":"N_MO","image":"res://asset/avatar/mo.png","dialogue":"S71L7"},
				{"choices":{"index":0,
						"S71L8": {
							"next_stage_index": 59,
							"market":"neutral_market1",
							"battle_field":{
								"basic_time": 60,
								"enemy_multiplier":4,
								"battle_music":"res://asset/music/battle/BGM07battle4.wav",
								"map":"res://asset/map/ip_ht.png",
								"enemy_list" : ["enemy1","enemy2"],
								"fail_stage_index": 44}}}}
				],
				"bg_image": "res://asset/bgim/imperial_gmaz3.png",
				"bg_music": "res://asset/music/stage/Strange.ogg"
			}]
		},
	59 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S72L1"},{"avatar":false,"dialogue":"S72L2"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S72L3"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S72L4"},
			{"avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S72L5"},
			{"name":"N_AS","avatar":false,"image":"res://asset/main_character/AS/base.png","dialogue":"S72L6"},
			{"avatar":true,"dialogue":"S72L7"},
			{"choices":{
						"index":0,
						"S72L8C1": {
							"next_stage_index": 118
						},
						"S72L8C2": {
							"next_stage_index": 60
						}
			}}],
				"bg_image": "res://asset/bgim/peacerealm_realm_ghh.png",
				"bg_music": "res://asset/music/stage/Harbingers.ogg"
			}]
		},
	60 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S73L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S73L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S73L3"},
			{"avatar":false,"dialogue":"S73L4"},
			{"avatar":true,"image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S73L5"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S73L6"},
			{"avatar":false,"image":"res://asset/main_character/IC/mouth_frown_a.png","dialogue":"S73L7"},
			{"avatar":true,"dialogue":"S73L8"},
			{"avatar":false,"dialogue":"S73L9"},
			{"avatar":true,"dialogue":"S73L10"},
			{"avatar":false,"dialogue":"S73L11"},
			{"avatar":true,"dialogue":"S73L12"},
			{"avatar":false,"dialogue":"S73L13"},
			{"avatar":true,"dialogue":"S73L14"},
			{"avatar":false,"dialogue":"S73L15"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S73L16"},
			{"choices":{
				"index":0,
				"S73L17": {
					"next_stage_index": 61,
					"market":"neutral_market1",
					"battle_field":{
						"basic_time": 60,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44,
						"special_npc_list" : [{
							"name":"SNPC_NE",
							"is_ally": true,
							"action_mode":0
						}]}}}}
			],
				"bg_image": "res://asset/bgim/ps_stmt.png",
				"bg_music": "res://asset/music/stage/Old Forest.ogg"
			}]
		},
	61 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S74L1"},
			{"avatar":true,"name":"N_NE","image":"res://asset/main_character/NE/avatar.png","dialogue":"S74L2"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S74L3"},
			{"avatar":true,"dialogue":"S74L4"},
			{"avatar":false,"dialogue":"S74L5"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S74L6"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S74L7"},
			{"avatar":true,"dialogue":"S74L8"},
			{"avatar":false,"dialogue":"S74L9"},
			{"avatar":true,"dialogue":"S74L10"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S74L11"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/smile_2.png","dialogue":"S74L12"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S74L13"},
			{"avatar":false,"dialogue":"S74L14"},
			{"avatar":true,"dialogue":"S74L15"},
			{"choices":{"index":0,
					"S74L16": {
						"next_stage_index": 62,
						"market":"neutral_market1",
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":1,
							"battle_music":"res://asset/music/battle/Track4.ogg",
							"map":"res://asset/map/ps_pw.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4"],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/ps_stmt.png",
				"bg_music": "res://asset/music/stage/Leave The Port.ogg"
			}]
		},
	62 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S75L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S75L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S75L3"},
			{"avatar":false,"dialogue":"S75L4"},
			{"avatar":true,"dialogue":"S75L5"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S75L6"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S75L7"},
			{"avatar":true,"dialogue":"S75L8"},
			{"avatar":false,"dialogue":"S75L9"},
			{"avatar":true,"dialogue":"S75L10"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S75L11"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S75L12"},
			{"avatar":false,"dialogue":"S75L13"},
			{"avatar":true,"dialogue":"S75L14"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S75L15"},
			{"avatar":true,"dialogue":"S75L16"},
			{"avatar":false,"dialogue":"S75L17"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S75L18"},
			{"avatar":false,"dialogue":"S75L19"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S75L20"},
			{"avatar":false,"dialogue":"S75L21"},
			{"avatar":true,"dialogue":"S75L22"},
			{"avatar":false,"dialogue":"S75L23"},
			{"avatar":true,"dialogue":"S75L24"},
			{"choices":{"index":0,
					"S75L25": {
						"next_stage_index": 63,
						"market":"neutral_market2",
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Track6_Bonus1.ogg",
							"map":"res://asset/map/ps_pw2.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6","alien7","alien8"],
							"fail_stage_index": 44
					}}}},
			{"avatar":false,"dialogue":"S75L26"},
			],
				"bg_image": "res://asset/bgim/ps_lib.png",
				"bg_music": "res://asset/music/stage/MemoryBox.ogg"
			}]
		},
	63 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S76L1"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S76L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S76L3"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/weird_smile.png","dialogue":"S76L4"},
			{"avatar":true,"name":"N_AS","image":"res://asset/main_character/AS/smile_2_a.png","dialogue":"S76L5"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S76L6"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/smile_2.png","dialogue":"S76L7"},
			{"avatar":true,"name":"N_NE","image":"res://asset/main_character/NE/weird_smile_a.png","dialogue":"S76L8"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S76L9"},
			{"avatar":true,"name":"N_NE","image":"res://asset/main_character/NE/weird_smile_a.png","dialogue":"S76L10"},
			{"avatar":false,"dialogue":"S76L11"},
			{"avatar":false,"dialogue":"S76L12"},
			{"avatar":false,"dialogue":"S76L13"},
			{"avatar":true,"dialogue":"S76L14"},
			{"avatar":false,"dialogue":"S76L15"},
			{"avatar":true,"dialogue":"S76L16"},
			{"rewards": {"index":0,
							"S76L17R1":{"K_ARMOR": 6},
							"S76L17R2":{"K_EFFICIENCY": 20},
							"S76L17R3":{"K_SPEED": 20}
					}},
			{"avatar":true,"dialogue":"S76L18"},
			{"avatar":false,"dialogue":"S76L19"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S76L20"}
			],
				"bg_image": "res://asset/bgim/ps_stmt.png",
				"bg_music": "res://asset/music/stage/MemoryBox.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S77L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/smile_2.png","dialogue":"S77L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S77L3"},
			{"avatar":false,"dialogue":"S77L4"},
			{"avatar":true,"dialogue":"S77L5"},
			{"avatar":false,"dialogue":"S77L6"},
			{"avatar":true,"dialogue":"S77L7"},
			{"avatar":false,"dialogue":"S77L8"},
			{"avatar":true,"dialogue":"S77L9"},
			{"avatar":false,"dialogue":"S77L10"},
			{"avatar":true,"dialogue":"S77L11"},
			{"avatar":false,"dialogue":"S77L12"},
			{"avatar":true,"dialogue":"S77L13"},
			{"avatar":false,"dialogue":"S77L14"},
			{"avatar":true,"dialogue":"S77L15"},
			{"avatar":false,"dialogue":"S77L16"},
			{"avatar":true,"dialogue":"S77L17"},
			{"avatar":false,"dialogue":"S77L18"},
			{"avatar":true,"dialogue":"S77L19"},
			{"avatar":false,"image":"res://asset/main_character/AS/shy.png","dialogue":"S77L20"},
			{"rewards": {"index":1,
							"S77L21R1":{"K_SANITY": 10},
							"S77L21R2":{"K_ELOQUENCY": 10},
							"S77L21R3":{"K_INTELLIGENCE": 10}
					}},
			{"avatar":false,"image":"res://asset/main_character/AS/shy_blush.png","dialogue":"S77L22"},
			{"avatar":true,"dialogue":"S77L23"},
			{"avatar":false,"dialogue":"S77L24"},
			{"avatar":true,"dialogue":"S77L25"},
			{"avatar":false,"dialogue":"S77L26"},
			{"avatar":true,"dialogue":"S77L27"}],
				"bg_image": "res://asset/bgim/ps_btls.png",
				"bg_music": "res://asset/music/stage/Dream Sakura.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S78L1"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/weird_smile.png","dialogue":"S78L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smile.png","dialogue":"S78L3"},
			{"avatar":false,"dialogue":"S78L4"},
			{"avatar":true,"dialogue":"S78L5"},
			{"avatar":true,"name":"N_AS","image":"res://asset/main_character/AS/shy_blush_a.png","dialogue":"S78L6"},
			{"avatar":false,"dialogue":"S78L7"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smile.png","dialogue":"S78L8"},
			{"avatar":false,"dialogue":"S78L9"},
			{"avatar":true,"name":"N_AS","image":"res://asset/main_character/AS/shy_a.png","dialogue":"S78L10"},
			{"avatar":false,"dialogue":"S78L11"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S78L12"},
			{"avatar":false,"dialogue":"S78L13"},
			{"avatar":true,"dialogue":"S78L14"},
			{"choices":{"index":2,
					"S78L15": {
						"next_stage_index": 64,
						"market":"neutral_market2",
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Track7_Bonus2.ogg",
							"map":"res://asset/map/al_hp.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12"],
							"fail_stage_index": 44
					}}}},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised_blush.png","dialogue":"S78L16"}
			],
				"bg_image": "res://asset/bgim/ps_exp.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			},
			]
		},
	64 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S79L1"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S79L2"},
			{"rewards": {"index":0,
					"S77L3R1":{"K_SPL": 1},
					"S77L3R2":{"K_TP": 1},
					"S77L3R3":{"K_RICO": 1},
					"S77L3R4":{"K_ADD_DMG": 10},
			}},
			{"avatar":false,"dialogue":"S79L4"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S79L5"},
			{"avatar":false,"dialogue":"S79L6"},
			{"avatar":true,"dialogue":"S79L7"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smirk.png","dialogue":"S79L8"},
			{"avatar":true,"dialogue":"S79L9"},
			{"avatar":false,"dialogue":"S79L10"},
			{"avatar":true,"dialogue":"S79L11"},
			{"avatar":false,"dialogue":"S79L12"},
			{"avatar":true,"dialogue":"S79L13"},
			{"avatar":false,"dialogue":"S79L14"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/angry.png","dialogue":"S79L15"},
			{"rewards": {"index":1,
					"S79L16R1":{"K_SANITY": 10},
					"S79L16R2":{"K_AFFINITY": 10}
			}},
			{"avatar":false,"dialogue":"S79L19"},
			{"avatar":true,"dialogue":"S79L20"},
			{"avatar":false,"dialogue":"S79L21"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S79L22"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smirk_a.png","dialogue":"S79L23"},
			{"avatar":false,"dialogue":"S79L24"},
			{"avatar":true,"dialogue":"S79L25"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S79L26"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smirk_a.png","dialogue":"S79L27"},
			{"avatar":false,"dialogue":"S79L28"},
			{"avatar":true,"dialogue":"S79L29"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S79L30"},
			{"avatar":false,"dialogue":"S79L31"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smirk_a.png","dialogue":"S79L32"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S79L33"}
			],
				"bg_image": "res://asset/bgim/ps_exp.png",
				"bg_music": "res://asset/music/stage/Pirate's Port.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S80L1"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S80L2"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smile.png","dialogue":"S80L3"},
			{"avatar":true,"dialogue":"S80L4"},
			{"avatar":false,"dialogue":"S80L5"},
			{"avatar":true,"dialogue":"S80L6"},
			{"avatar":false,"dialogue":"S80L7"},
			{"avatar":true,"dialogue":"S80L8"},
			{"avatar":false,"dialogue":"S80L9"},
			{"avatar":true,"dialogue":"S80L10"}],
				"bg_image": "res://asset/bgim/ps_road.png",
				"bg_music": "res://asset/music/stage/Flying.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S81L1"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S81L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S81L3"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S81L4"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S81L5"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S81L6"},
			{"choices":{"index":2,
					"S81L7": {
						"next_stage_index": 65,
						"market":"neutral_market3",
						"battle_field":{
							"basic_time": 100,
							"enemy_multiplier":3,
							"battle_music":"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
							"map":"res://asset/map/al_cs.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13","alien14","alien15"],
							"fail_stage_index": 44
					}}}}],
				"bg_image": "res://asset/bgim/ps_exp.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	65 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S82L1"},
			{"avatar":true,"name":"N_AS","image":"res://asset/main_character/AS/avatar.png","dialogue":"S82L2"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S82L3"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S82L4"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S82L5"},
			{"avatar":false,"dialogue":"S82L6"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S82L7"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S82L8"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S82L9"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S82L10"},
			{"avatar":true,"dialogue":"S82L11"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S82L12"},
			{"avatar":true,"dialogue":"S82L13"},
			{"avatar":false,"dialogue":"S82L14"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/avatar.png","dialogue":"S82L15"},
			{"avatar":true,"name":"N_AS","image":"res://asset/main_character/AS/avatar.png","dialogue":"S82L16"}],
				"bg_image": "res://asset/bgim/ps_exp.png",
				"bg_music": "res://asset/music/stage/IslandScenery.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S83L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/smile_2.png","dialogue":"S83L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smile_a.png","dialogue":"S83L3"},
			{"avatar":false,"dialogue":"S83L4"},
			{"avatar":true,"dialogue":"S83L5"},
			{"avatar":false,"dialogue":"S83L6"},
			{"avatar":true,"dialogue":"S83L7"},
			{"avatar":false,"dialogue":"S83L8"},
			{"avatar":true,"dialogue":"S83L9"},
			{"avatar":false,"dialogue":"S83L10"},
			{"avatar":true,"dialogue":"S83L11"},
			{"avatar":false,"dialogue":"S83L12"},
			{"avatar":true,"dialogue":"S83L13"},
			{"avatar":false,"dialogue":"S83L14"},
			{"avatar":true,"dialogue":"S83L15"}],
				"bg_image": "res://asset/bgim/ps_road.png",
				"bg_music": "res://asset/music/stage/Flying.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S84L1"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/smile_2.png","dialogue":"S84L2"},
			{"avatar":true,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smile_a.png","dialogue":"S84L3"},
			{"avatar":false,"dialogue":"S84L4"},
			{"avatar":true,"dialogue":"S84L5"},
			{"avatar":false,"dialogue":"S84L6"},
			{"choices":{"index":0,
					"S84L7": {
						"next_stage_index": 66,
						"market":"neutral_market3",
						"battle_field":{
							"basic_time": 100,
							"enemy_multiplier":4,
							"battle_music":"res://asset/music/battle/BGM07battle1.wav",
							"map":"res://asset/map/ps_pw.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/ps_exp.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	66 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S85L1"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_smile.png","dialogue":"S85L2"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S85L3"},
			{"avatar":false,"dialogue":"S85L4"},
			{"avatar":true,"dialogue":"S85L5"},
			{"avatar":false,"dialogue":"S85L6"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S85L7"},
			{"avatar":true,"dialogue":"S85L8"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S85L9"},
			{"choices":{"index":0,
					"S85L10": {
						"next_stage_index": 67,
						"market":"super_market",
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/BGM07battle2.wav",
							"map":"res://asset/map/ps_pw.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
					}}}},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S85L11"},],
				"bg_image": "res://asset/bgim/ps_exp.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	67 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S86L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S86L2"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S86L3"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S86L4"},
			{"avatar":true,"dialogue":"S86L5"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised.png","dialogue":"S86L6"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S86L7"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/surprised.png","dialogue":"S86L8"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S86L9"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S86L10"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S86L11"},
			{"choices":{"index":1,
					"S86L12C1": {
						"next_stage_index": 68
					},
					"S86L12C2": {
						"next_stage_index": 82
			}}},
			{"avatar":false,"dialogue":"S86L13"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/surprised.png","dialogue":"S86L14"},
			],
				"bg_image": "res://asset/bgim/pw_tlp.png",
				"bg_music": "res://asset/music/stage/IslandScenery.ogg"
			}]
		},
	68 : {"scenario_list" :
			[{"line":[{"avatar":true,"dialogue":"S87L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised.png","dialogue":"S87L2"},
			{"avatar":true,"dialogue":"S87L3"},
			{"avatar":false,"dialogue":"S87L4"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L5"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L6"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L7"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised.png","dialogue":"S87L8"},
			{"avatar":true,"dialogue":"S87L9"},
			{"avatar":false,"dialogue":"S87L10"},
			{"avatar":true,"dialogue":"S87L11"},
			{"avatar":false,"dialogue":"S87L12"},
			{"avatar":true,"dialogue":"S87L13"},
			{"avatar":false,"dialogue":"S87L14"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L15"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L16"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L17"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L18"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L19"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L20"},
			{"avatar":false,"dialogue":"S87L21"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L22"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L23"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L24"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L25"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S87L26"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S87L27"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S87L28"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S87L29"},
			{"choices":{"index":0,
					"S87L30C1": {"next_stage_index": 69},
					"S87L30C2": {
						"req":{"K_ELOQUENCY":30},
						"next_stage_index": 76,
						"battle_field":{
							"basic_time": 100,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
							"map":"res://asset/map/al_pa.png",
							"special_npc_list" : [{
										"name":"SNPC_VI",
										"is_ally": false,
										"action_mode":0,
										"destroy_stage_index": 79
							}],
							"enemy_list" : ["alien3","alien4"],
							"fail_stage_index": 44
					}}}},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S87L31"},
			],
				"bg_image": "res://asset/bgim/pw_vi.png",
				"bg_music": "res://asset/music/stage/Warfare.ogg"
			}]
		},
	69 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S88L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S88L2"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L3"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S88L4"},
			{"avatar":true,"dialogue":"S88l5"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S88L6"},
			{"avatar":true,"dialogue":"S88L7"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S88L8"},
			{"avatar":true,"dialogue":"S88L9"},
			{"avatar":false,"dialogue":"S88L10"},
			{"avatar":true,"dialogue":"S88L11"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L12"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L13"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L14"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L15"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S88L16"},
			{"avatar":true,"dialogue":"S88L17"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L18"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L19"},
			{"avatar":false,"dialogue":"S88L20"},
			{"avatar":true,"dialogue":"S88L21"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L22"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L23"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L24"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L25"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L26"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L27"},
			{"avatar":true,"name":"N_E","image":"res://asset/avatar/npc.png","dialogue":"S88L28"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L29"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S88L30"},
			{"avatar":true,"dialogue":"S88L31"},
			{"avatar":false,"dialogue":"S88L32"},
			{"avatar":true,"dialogue":"S88L33"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S88L34"},	
			{"avatar":true,"dialogue":"S88L35"},
			{"avatar":false,"dialogue":"S88L36"},
			{"avatar":true,"dialogue":"S88L37"},
			{"avatar":false,"dialogue":"S88L38"},
			{"avatar":true,"dialogue":"S88L39"},
			{"avatar":false,"dialogue":"S88L40"},
			{"avatar":true,"dialogue":"S88L41"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L42"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L43"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L44"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L45"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S88L46"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S88L47"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S88L48"},
			{"avatar":true,"dialogue":"S88L49"},
			{"choices":{"index":0,
					"S88L50C1": {"next_stage_index": 70},
					"S88L50C2": {
						"req":{"K_INTELLIGENCE":30},
						"next_stage_index": 72,
			}}}],
				"bg_image": "res://asset/bgim/pw_vi.png",
				"bg_music": "res://asset/music/stage/Strange Road.ogg"
			}]
		},
	70 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S89L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S89L2"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S89L3"},
			{"avatar":false,"dialogue":"S89L4"},
			{"avatar":true,"name":"N_ZANDER","dialogue":"S89L5"},
			{"avatar":false,"dialogue":"S89L6"},
			{"avatar":true,"dialogue":"S89L7"},
			{"avatar":true,"name":"N_NV","image":"res://asset/avatar/nv.png","dialogue":"S89L8"},
			{"avatar":false,"dialogue":"S89L9"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S89L10"},
			{"choices":{"index":0,
					"S89L11": {
						"next_stage_index": 44,
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":0,
							"battle_music":"res://asset/music/battle/Battle-Vampire_loop.ogg",
							"map":"res://asset/map/pw_zdr.png",
							"special_npc_list" : [{
										"name":"SNPC_ZDR",
										"is_ally": false,
										"action_mode":0,
										"destroy_stage_index": 71,
							}],
							"enemy_list" : [],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/pwtps.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	71 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S90L1"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S90L2"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S90L3"},
			{"avatar":false,"dialogue":"S90L4"},
			{"avatar":true,"dialogue":"S90L5"},
			{"avatar":false,"dialogue":"S90L6"},
			{"avatar":true,"dialogue":"S90L7"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S90L8"},
			{"avatar":true,"dialogue":"S90L9"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S90L10"},
			{"avatar":true,"dialogue":"S90L11"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mutated/base.png","dialogue":"S90L12"},
			{"avatar":true,"dialogue":"S90L13"},
			{"avatar":false,"dialogue":"S90L14"},
			{"avatar":true,"dialogue":"S90L15"},
			{"avatar":false,"dialogue":"S90L16"}
			],
				"bg_image": "res://asset/bgim/ps_stmt.png",
				"bg_music": "res://asset/music/stage/North Star.ogg"
			}],
			"end_stage": "PSTAR"
		},
	72 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S91L1"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S91L2"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S91L3"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S91L4"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S91L5"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/surprised.png","dialogue":"S91L6"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised.png","dialogue":"S91L7"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S91L8"},
			{"choices":{"index":0,
					"S91L9": {
						"next_stage_index": 73,
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":4,
							"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
							"map":"res://asset/map/al_pa.png",
							"special_npc_list" : [{
										"name":"SNPC_VI",
										"is_ally": false,
										"action_mode":0}],
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/pw_vi.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	73 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S92L1"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/smile_2.png","dialogue":"S92L2"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/smile_2.png","dialogue":"S92L3"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S92L4"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S92L5"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S92L6"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S92L7"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S92L8"},
			{"avatar":true,"dialogue":"S92L9"},
			{"avatar":false,"dialogue":"S92L10"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S92L11"},
			{"avatar":true,"dialogue":"S92L12"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S92L13"},
			{"avatar":true,"name":"N_NV","image":"res://asset/avatar/nv.png","dialogue":"S92L14"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S92L15"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S92L16"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S92L17"},
			{"choices":{"index":0,
				"S9218LC1": {"next_stage_index": 74,"req":{"K_ELOQUENCY":40}},
				"S9218LC2": {"next_stage_index": 75}
				}}
			],
				"bg_image": "res://asset/bgim/pw_viwn.png",
				"bg_music": "res://asset/music/stage/To The End.ogg"
			}]
		},
	74 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S93L1"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S93L2"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S93L3"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S93L4"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/base.png","dialogue":"S93L5"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S93L6"},
			{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S93L7"},
			{"avatar":false,"dialogue":"S93L8"},
			{"avatar":true,"dialogue":"S93L9"},
			{"avatar":false,"dialogue":"S93L10"}
			],
				"bg_image": "res://asset/bgim/pw_viwn.png",
				"bg_music": "res://asset/music/stage/ATaleForTheJourney.ogg"
			}],
			"end_stage": "PWORLD"
		},
	75 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S94L1"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S94L2"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/surprised.png","dialogue":"S94L3"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised.png","dialogue":"S94L4"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S94L5"}
			],
				"bg_image": "res://asset/bgim/pw_viwn.png",
				"bg_music": "res://asset/music/stage/Death Star.ogg"
			}],
			"end_stage": "NSTRENGTH"
		},
	76 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S95L1"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S95L2"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/surprised.png","dialogue":"S95L3"},
			{"avatar":true,"dialogue":"S95L4"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S95L5"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S95L6"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S95L7"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S95L8"},
			{"avatar":false,"dialogue":"S95L9"},
			{"avatar":true,"dialogue":"S95L10"},
			{"avatar":false,"dialogue":"S95L11"},
			{"avatar":true,"dialogue":"S95L12"},
			{"avatar":false,"dialogue":"S95L13"},
			{"avatar":true,"dialogue":"S95L14"},
			{"avatar":false,"dialogue":"S95L15"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/base.png","dialogue":"S95L16"},
			{"avatar":true,"dialogue":"S95L17"},
			{"avatar":false,"dialogue":"S95L18"},
			{"avatar":true,"dialogue":"S95L19"},
			{"avatar":false,"dialogue":"S95L20"},
			{"avatar":true,"dialogue":"S95L21"},
			{"avatar":false,"name":"N_IC","image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S95L22"}],
				"bg_image": "res://asset/bgim/pw_vi.png",
				"bg_music": "res://asset/music/stage/Red Clouds.ogg"
			}]
		},
	77 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S96L1"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S96L2"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S96L3"},
			{"avatar":true,"dialogue":"S96L4"},
			{"avatar":false,"dialogue":"S96L5"},
			{"avatar":true,"name":"N_NV","image":"res://asset/avatar/nv.png","dialogue":"S96L6"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S96L7"},
			{"avatar":false,"dialogue":"S96L8"},
			{"avatar":true,"dialogue":"S96L9"},
			{"choices":{"index":0,
					"S96L10": {
						"next_stage_index": 44,
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":0,
							"battle_music":"res://asset/music/battle/Battle-Vampire_loop.ogg",
							"map":"res://asset/map/pw_zdr2.png",
							"special_npc_list" : [{
										"name":"SNPC_ZDR2",
										"is_ally": false,
										"action_mode":0,
										"destroy_stage_index": 78,
							}],
							"enemy_list" : [],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/pwtps.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	78 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S97L1"}],
				"bg_image": "res://asset/bgim/bg.png",
				"bg_music": "res://asset/music/stage/Sadness.ogg"
			}],
			"end_stage": "NHANGMAN"
		},
	79 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S98L1"},
			{"avatar":true,"name":"N_NV","image":"res://asset/avatar/nv.png","dialogue":"S98L2"},
			{"choices":{"index":0,
				"S98L3C1": {
					"req":{"K_ACCURACY":50,"K_SANITY":20},
					"next_stage_index": 80
				},
				"S98L3C2": {
					"next_stage_index": 75
				}}}
			],
				"bg_image": "res://asset/bgim/pw_viwn.png",
				"bg_music": "res://asset/music/stage/InExtremis.ogg"
			}]
		},
	80 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S99L1"},
			{"avatar":false,"name":"N_NE","image":"res://asset/main_character/NE/surprised.png","dialogue":"S99L2"},
			{"choices":{"index":0,
					"S99L3": {
						"next_stage_index": 81,
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":10,
							"battle_music":"res://asset/music/battle/BGM07battle3.wav",
							"map":"res://asset/map/ip_ztb.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
			}}}}],
				"bg_image": "res://asset/bgim/pw_viwn.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	81 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S100L1"},
			{"avatar":true,"name":"N_NE","image":"res://asset/main_character/NE/smile_a.png","dialogue":"S100L2"},
			{"avatar":false,"name":"N_AS","image":"res://asset/main_character/AS/base.png","dialogue":"S100L3"},
			{"avatar":true,"dialogue":"S100L4"}
			],
				"bg_image": "res://asset/bgim/pw_wn.png",
				"bg_music": "res://asset/music/stage/Mountain God's Shrine.ogg"
			}],
			"end_stage":"PSTRENGTH"
		},
	82 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S101L1"},
			{"avatar":true,"name":"N_NV","image":"res://asset/avatar/nv.png","dialogue":"S101L2"},
			{"choices":{"index":0,
				"S101L3C1": {
					"req":{"K_INTELLIGENCE":30},
					"next_stage_index": 87
				},
				"S101L3C2": {
					"next_stage_index": 83
				},
				"S101L3C3": {
					"req":{"K_SANITY":20},
					"next_stage_index": 68
				}}}],
				"bg_image": "res://asset/bgim/pw_wn.png",
				"bg_music": "res://asset/music/stage/Rise Up The Sword.ogg"
			}]
		},
	83 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S102L1"},
			{"choices":{"index":0,
					"S102L2": {
						"next_stage_index": 84,
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":10,
							"battle_music":"res://asset/music/battle/BGM07battle4.wav",
							"map":"res://asset/map/ip_ztb.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
					}}}}],
				"bg_image": "res://asset/bgim/pw_wn.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	84 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S103L1"},
			{"choices":{"index":0,
					"S103L2C1": {
						"next_stage_index": 44,
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":3,
							"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"special_npc_list" : [{
								"name":"SNPC_VI",
								"is_ally": false,
								"action_mode":0,
								"destroy_stage_index": 85,
							}],
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
					}},
					"S103L2C2": {"next_stage_index": 86}
					}}],
				"bg_image": "res://asset/bgim/pwtps.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	85 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S104L1"},
			{"choices":{"index":0,
					"S104L2": {
						"next_stage_index": 81,
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":10,
							"battle_music":"res://asset/music/battle/Track4.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"enemy_list" : ["alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/pwtps.png",
				"bg_music": "res://asset/music/stage/Revolve.ogg"
			}]
		},
	86 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S105L1"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S105L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S105L3"},
			{"avatar":true,"dialogue":"S105L4"},
			{"avatar":false,"dialogue":"S105L5"},
			{"avatar":true,"dialogue":"S105L6"},
			{"avatar":false,"dialogue":"S105L7"},
			{"avatar":true,"dialogue":"S105L8"},
			{"name":"N_AS","avatar":false,"image":"res://asset/main_character/AS/base.png","dialogue":"S105L9"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S105L10"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S105L11"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S105L12"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S105L13"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S105L14"},
			{"avatar":false,"dialogue":"S105L15"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S105L16"},
			{"avatar":true,"dialogue":"S105L17"},
			{"avatar":false,"dialogue":"S105L18"},
			{"avatar":true,"dialogue":"S105L19"},
			{"avatar":false,"dialogue":"S105L20"},
			{"avatar":true,"dialogue":"S105L21"},
			{"avatar":false,"dialogue":"S105L22"},
			{"avatar":true,"dialogue":"S105L23"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S105L24"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S105L25"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S105L26"},
			{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S105L27"},
			{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S105L28"}],
				"bg_image": "res://asset/bgim/pw_vi.png",
				"bg_music": "res://asset/music/stage/Soul Of A Winter.ogg"
			}],
			"next_stage_index": 70
		},
	87 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S106L1"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S106L2"},
				{"avatar":true,"name":"N_WN","image":"res://asset/avatar/wn.png","dialogue":"S106L3"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S106L4"},
				{"avatar":true,"dialogue":"S106L5"},
				{"avatar":false,"dialogue":"S106L6"},
				{"name":"N_AS","avatar":false,"image":"res://asset/main_character/AS/base.png","dialogue":"S107L7"},
				{"avatar":true,"dialogue":"S106L8"},
				{"avatar":false,"dialogue":"S106L9"},
				{"avatar":true,"dialogue":"S106L10"},
				{"avatar":false,"dialogue":"S106L11"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S106L12"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S106L13"},
				{"avatar":true,"name":"N_FW","image":"res://asset/avatar/fw.png","dialogue":"S106L14"},
				{"name":"N_AS","avatar":false,"image":"res://asset/main_character/AS/base.png","dialogue":"S107L15"},
				{"avatar":true,"dialogue":"S106L16"},
				{"avatar":false,"dialogue":"S106L17"},
				{"avatar":true,"dialogue":"S106L18"},
				{"avatar":false,"dialogue":"S106L19"},
				{"avatar":true,"name":"N_VI","image":"res://asset/avatar/vi.png","dialogue":"S106L20"},
				{"avatar":true,"dialogue":"S106L21"},
				{"avatar":false,"dialogue":"S106L22"},
				{"avatar":true,"dialogue":"S106L23"},
				{"avatar":false,"dialogue":"S106L24"},
				{"avatar":true,"dialogue":"S106L25"},
				{"choices":{"index":0,
					"S106L26C1": {
						"next_stage_index": 73,
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":3,
							"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"special_npc_list" : [{
								"name":"SNPC_VI",
								"is_ally": false,
								"action_mode":0
							}],
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
				}},
				"S106L26C2": {"next_stage_index": 70},
				}},
				{"avatar":false,"dialogue":"S106L27"},
				{"avatar":true,"dialogue":"S106L28"},
			],
				"bg_image": "res://asset/bgim/pw_wnc.png",
				"bg_music": "res://asset/music/stage/Sand.ogg"
			}]
		},
	88 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S107L1"},
				{"avatar":true,"name":"N_ZJY","image":"res://asset/avatar/zjy.png","dialogue":"S107L2"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S107L3"},
				{"avatar":true,"dialogue":"S107L4"},
				{"avatar":false,"dialogue":"S107L5"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L6"},
				{"avatar":false,"dialogue":"S107L7"},
				{"avatar":true,"dialogue":"S107L8"},
				{"avatar":true,"name":"N_ZJY","image":"res://asset/avatar/zjy.png","dialogue":"S107L9"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L10"},
				{"avatar":true,"name":"N_ZJY","image":"res://asset/avatar/zjy.png","dialogue":"S107L11"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L12"},
				{"avatar":true,"name":"N_ZJY","image":"res://asset/avatar/zjy.png","dialogue":"S107L13"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L14"},
				{"avatar":true,"name":"N_ZJY","image":"res://asset/avatar/zjy.png","dialogue":"S107L15"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L16"},
				{"avatar":true,"name":"N_ZJY","image":"res://asset/avatar/zjy.png","dialogue":"S107L17"},
				{"avatar":false,"dialogue":"S107L18"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L19"},
				{"avatar":false,"dialogue":"S107L20"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L21"},
				{"avatar":false,"dialogue":"S107L22"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L23"},
				{"avatar":false,"dialogue":"S107L24"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L25"},
				{"avatar":false,"dialogue":"S107L26"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S107L27"},
				{"choices":{"index":0,
					"S107L28C1": {"next_stage_index": 89},
					"S107L28C2": {"next_stage_index": 90}
					}}
				],
				"bg_image": "res://asset/bgim/imperial_mtrmh.png",
				"bg_music": "res://asset/music/stage/Ice River.ogg"
			}]
		},
	89 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S108L1"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S108L2"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S108L3"},
				{"avatar":true,"dialogue":"S108L4"},
				{"avatar":false,"dialogue":"S108L5"},
				{"avatar":true,"dialogue":"S108L6"},
				{"avatar":false,"dialogue":"S108L7"},
				{"avatar":true,"dialogue":"S108L8"},
				{"choices":{"index":0,
					"S108L9": {
						"next_stage_index": 44,
						"market":"super_market",
						"battle_field":{
							"basic_time": 300,
							"enemy_multiplier":1,
							"battle_music":"res://asset/music/battle/Battle-Furious-GUITAR_loop.ogg",
							"map":"res://asset/map/ip_zjy.png",
							"special_npc_list" : [{
								"name":"SNPC_ZJY",
								"is_ally": false,
								"action_mode":0,
								"destroy_stage_index": 91,
							}],
							"enemy_list" : ["enemy1"],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/imperial_mtrmh.png",
				"bg_music": "res://asset/music/stage/Uplifter.ogg"
			}]
		},
	90 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S109L1"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S109L2"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S109L3"},
				{"avatar":true,"dialogue":"S109L4"},
				{"avatar":false,"dialogue":"S109L5"}],
				"bg_image": "res://asset/bgim/imperial_mtrmh.png",
				"bg_music": "res://asset/music/stage/Time for Sacrifice.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S110L1"},
				{"choices":{"index":0,
					"S110L2": {
						"next_stage_index": 5,
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":0,
							"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
							"map":"res://asset/map/pr_gs.png",
							"special_npc_list" : [
							{"name":"SNPC_HS",
								"is_ally": false,
								"action_mode":0},
							{"name":"SNPC_AD",
								"is_ally": true,
								"action_mode":0,
								"destroy_stage_index": 118,
							}],
							"enemy_list" : [],
							"fail_stage_index": 44
					}}}}
			],
				"bg_image": "res://asset/bgim/peacerealm_realm_ghh_lwh.png"
			}]
		},
	91 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S111L1"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S111L2"},
				{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S111L3"},
				{"avatar":false,"dialogue":"S111L4"},
				{"avatar":true,"dialogue":"S111L5"},
				{"choices":{"index":0,
					"S111L6": {
						"next_stage_index": 44,
						"market":"super_market",
						"battle_field":{
							"basic_time": 300,
							"enemy_multiplier":1,
							"battle_music":"res://asset/music/battle/Battle-Grief_loop.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"special_npc_list" : [{
								"name":"SNPC_ZTB",
								"is_ally": false,
								"action_mode":0,
								"destroy_stage_index": 92,
							}],
							"enemy_list" : ["enemy1","enemy2"],
							"fail_stage_index": 44
					}}}}],
				"bg_image": "res://asset/bgim/nrt.png",
				"bg_music": "res://asset/music/stage/Return.ogg"
			}]
		},
	92 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S112L1"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S112L2"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S112L3"},
				{"avatar":true,"dialogue":"S112L4"},
				{"avatar":false,"dialogue":"S112L5"},
				{"avatar":true,"dialogue":"S112L6"},
				{"avatar":false,"dialogue":"S112L7"},
				{"choices":{"index":0,
					"S112L8C1": {"next_stage_index": 93},
					"S112L8C2": {"next_stage_index": 103,
					"market":"super_market",
					"battle_field":{
						"basic_time": 40,
						"enemy_multiplier":0,
						"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
						"map":"res://asset/map/ip_def.png",
						"enemy_list" : [],
						"special_npc_list" : [{
								"name":"SNPC_HS",
								"is_ally": false,
								"action_mode":0}],
						"fail_stage_index": 44
				}}
						}}
				],
				"bg_image": "res://asset/bgim/ppr_rcrp.png",
				"bg_music": "res://asset/music/stage/MechanicalDancer.ogg"
			}]
		},
	93 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S113L1"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S113L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S113L3"},
				{"avatar":false,"dialogue":"S113L4"},
				{"avatar":true,"dialogue":"S113L5"},
				{"avatar":false,"dialogue":"S113L6"},
				{"avatar":true,"dialogue":"S113L7"},
				{"avatar":false,"dialogue":"S113L8"},
				{"avatar":true,"dialogue":"S113L9"},
				{"avatar":false,"dialogue":"S113L10"},
				{"avatar":true,"image":"res://asset/main_character/IC/mouth_smirk.png","dialogue":"S113L11"},
				{"avatar":false,"image":"res://asset/main_character/NE/shy_blush.png","dialogue":"S113L12"},
				{"avatar":true,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S113L13"},
				{"avatar":false,"image":"res://asset/main_character/NE/angry.png","dialogue":"S113L14"},
				{"avatar":true,"dialogue":"S113L15"},
				{"avatar":false,"dialogue":"S113L16"},
				{"avatar":true,"dialogue":"S113L17"},
				{"avatar":false,"dialogue":"S113L18"},
				{"avatar":true,"dialogue":"S113L19"},
				{"avatar":false,"dialogue":"S113L20"},
				{"avatar":true,"dialogue":"S113L21"},
				{"avatar":false,"dialogue":"S113L22"},
				{"avatar":true,"dialogue":"S113L23"},
				{"avatar":false,"dialogue":"S113L24"},
				{"avatar":true,"dialogue":"S113L25"},
				{"avatar":false,"dialogue":"S113L26"},
				{"avatar":true,"dialogue":"S113L27"},
				{"avatar":false,"dialogue":"S113L28"},
				{"avatar":true,"dialogue":"S113L29"},
				{"avatar":false,"dialogue":"S113L30"},
				{"avatar":true,"dialogue":"S113L31"},
				{"choices":{"index":1,
					"S113L32C1": {"next_stage_index": 94},
					"S113L32C2": {"next_stage_index": 95},
					"S113L32C3": {"next_stage_index": 96}}}],
				"bg_image": "res://asset/bgim/ppr_rcrp.png",
				"bg_music": "res://asset/music/stage/MechanicalDancer.ogg"
			}]
		},
	94 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S114L1"},
				{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S114L2"},
				{"name":"N_NE","avatar":true,"image":"res://asset/main_character/NE/weird_smile_a.png","dialogue":"S114L3"},
				{"avatar":false,"dialogue":"S114L4"}],
				"bg_image": "res://asset/bgim/ppr_rcrp.png",
				"bg_music": "res://asset/music/stage/Death Crew.ogg"
			}],
			"end_stage": "NSTAR"
		},
	95 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S115L1"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S115L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S115L3"},
				{"avatar":false,"dialogue":"S115L4"},
				{"avatar":true,"dialogue":"S115L5"},
				{"avatar":false,"dialogue":"S115L6"},
				{"avatar":true,"dialogue":"S115L7"},
				{"avatar":false,"dialogue":"S115L8"}],
				"bg_image": "res://asset/bgim/ppr_rcrp.png",
				"bg_music": "res://asset/music/stage/Lonely Island.ogg"
			}],
			"next_stage_index": 105
		},
	96 : {"scenario_list" :
			[{"line":[{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S116L1"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S116L2"},
				{"avatar":false,"dialogue":"S116L3"},
				{"avatar":true,"dialogue":"S116L4"},
				{"avatar":false,"dialogue":"S116L5"},
				{"avatar":true,"dialogue":"S116L6"},
				{"avatar":false,"dialogue":"S116L7"},
				{"avatar":true,"dialogue":"S116L8"},
				{"avatar":false,"dialogue":"S116L9"},
				{"avatar":true,"dialogue":"S116L10"},
				{"avatar":false,"dialogue":"S116L11"},
				{"avatar":true,"dialogue":"S116L12"},
				{"avatar":false,"dialogue":"S116L13"},
				{"avatar":true,"dialogue":"S116L14"}],
				"bg_image": "res://asset/bgim/ppr_rcrp.png",
				"bg_music": "res://asset/music/stage/Pirate's Port.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S117L1"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S117L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S117L3"},
				{"avatar":false,"dialogue":"S117L4"},
				{"avatar":true,"dialogue":"S117L5"},
				{"avatar":false,"dialogue":"S117L6"},
				{"avatar":true,"dialogue":"S117L7"},
				{"avatar":false,"dialogue":"S117L8"},
				{"choices":{"index":0,
					"S110L2": {
						"next_stage_index": 97,
						"market":"neutral_market1",
						"battle_field":{
							"basic_time": 60,
							"enemy_multiplier":4,
							"battle_music":"res://asset/music/battle/Battle-Dawn_loop.ogg",
							"map":"res://asset/map/ip_def2.png",
							"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
							"fail_stage_index": 44,
							"special_npc_list" : [{
								"name":"SNPC_NE",
								"is_ally": true,
								"action_mode":0
						}]}}}},
				{"avatar":true,"dialogue":"S110L2"},
				],
				"bg_image": "res://asset/bgim/pwtps.png",
				"bg_music": "res://asset/music/stage/Abandoned Ship.ogg"
			}]
		},
	97 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S118L1"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/surprised.png","dialogue":"S118L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S118L3"},
				{"avatar":false,"dialogue":"S118L4"},
				{"avatar":true,"dialogue":"S118L5"}],
				"bg_image": "res://asset/bgim/ruined_ps.png",
				"bg_music": "res://asset/music/stage/Sadness.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S119L1"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/surprised.png","dialogue":"S119L2"},
				{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S119L3"},
				{"avatar":false,"dialogue":"S119L4"},
				{"avatar":true,"dialogue":"S119L5"},
				{"avatar":false,"dialogue":"S119L6"},
				{"avatar":true,"dialogue":"S119L7"},
				{"avatar":false,"dialogue":"S119L8"},
				{"avatar":true,"dialogue":"S119L9"},
				{"choices":{"index":0,
					"S119L9": {
						"next_stage_index": 98,
						"battle_field":{
							"basic_time": 100,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Track6_Bonus1.ogg",
							"map":"res://asset/map/ps_pw.png",
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6","alien7"],
							"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/ps_cavern.png"
			}]
		},
	98 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S120L1"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/smile.png","dialogue":"S120L2"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S120L3"},
				{"avatar":false,"dialogue":"S120L4"},
				{"avatar":true,"dialogue":"S120L5"},
				{"avatar":false,"dialogue":"S120L6"},
				{"choices":{"index":0,
					"S120L7C1": {
						"next_stage_index": -98,
						"market":"neutral_market1"},
					"S120L7C2": {
						"next_stage_index": -98,
						"market":"neutral_market3"}
						}}],
				"bg_image": "res://asset/bgim/ps_cavern.png",
				"bg_music": "res://asset/music/stage/Ancient Woods.ogg"
			}]},
	-98 : {"scenario_list" :
			[{"line":[{"choices":{"index":0,
					"S120L8": {
						"next_stage_index": 99,
						"battle_field":{
							"basic_time": 100,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Track7_Bonus2.ogg",
							"map":"res://asset/map/ps_pw2.png",
							"enemy_list" : ["alien11","alien12","alien13","alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
					}}}}],
				"bg_image": "res://asset/bgim/ps_cavern.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]},
	99 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S121L1"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/smile.png","dialogue":"S121L2"},
			{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S121L3"},
			{"avatar":false,"dialogue":"S121L4"},
			{"avatar":true,"dialogue":"S121L5"},
			{"avatar":false,"dialogue":"S121L6"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S121L7"},
			{"choices":{"index":0,
					"S120L8": {
						"next_stage_index": 44,
						"battle_field":{
							"basic_time": 240,
							"enemy_multiplier":1,
							"battle_music":"res://asset/music/battle/Battle-Vampire_loop.ogg",
							"map":"res://asset/map/pw_zdr2.png",
							"special_npc_list" : [{
										"name":"SNPC_ZDR2",
										"is_ally": false,
										"action_mode":0,
										"destroy_stage_index": 100,
							}],
							"enemy_list" : ["alien8","alien9","alien10"],
							"fail_stage_index": 44
			}}}}],
				"bg_image": "res://asset/bgim/ps_cavern.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	100 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S122L1"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/smile.png","dialogue":"S122L2"},
			{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S122L3"},
			{"avatar":false,"dialogue":"S122L4"},
			{"avatar":true,"dialogue":"S122L5"},
			{"avatar":false,"dialogue":"S122L6"},
			{"avatar":true,"name":"N_CD","image":"res://asset/avatar/cd.png","dialogue":"S122L7"},
			{"avatar":false,"dialogue":"S122L8"},
			{"avatar":true,"dialogue":"S122L9"},
			{"avatar":false,"dialogue":"S122L10"},
			{"choices":{"index":0,
					"S122L11C1": {
						"next_stage_index": 101,
						"market":"neutral_market1"},
					"S122L11C2": {
						"next_stage_index": 101,
						"market":"neutral_market3"}
			}}],
				"bg_image": "res://asset/bgim/ps_stmt.png",
				"bg_music": "res://asset/music/stage/Mountain God's Shrine.ogg"
			}]
		},
	101 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S123L1"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/smile.png","dialogue":"S123L2"},
			{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S123L3"},
			{"avatar":false,"dialogue":"S123L4"},
			{"avatar":true,"dialogue":"S123L5"},
			{"avatar":false,"dialogue":"S123L6"}],
				"bg_image": "res://asset/bgim/pw_tlp.png",
				"bg_music": "res://asset/music/stage/Beyond The Sun.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S123L7"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/base.png","dialogue":"S123L8"},
			{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S123L9"},
			{"avatar":false,"dialogue":"S123L10"},
			{"avatar":true,"dialogue":"S123L11"},
			{"name":"N_AS","avatar":true,"image":"res://asset/main_character/AS/avatar.png","dialogue":"S123L12"},
			{"avatar":false,"dialogue":"S123L13"},
			{"avatar":true,"dialogue":"S123L14"},
			{"avatar":false,"dialogue":"S123L15"},
			{"avatar":true,"dialogue":"S123L16"},
			{"avatar":false,"dialogue":"S123L17"},
			{"avatar":true,"dialogue":"S123L18"},
			{"avatar":false,"dialogue":"S123L19"},
			{"avatar":true,"dialogue":"S123L20"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/angry_2.png","dialogue":"S123L21"},
			{"choices":{"index":0,
					"S123L22": {
						"next_stage_index": 44,
						"battle_field":{
							"basic_time": 240,
							"enemy_multiplier":1,
							"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"special_npc_list" : [{
										"name":"SNPC_VI",
										"is_ally": false,
										"action_mode":0,
										"destroy_stage_index": 100,
							}],
							"enemy_list" : ["alien1","alien2","alien3","alien4","alien5","alien6",
								"alien7","alien8","alien9","alien10","alien11","alien12","alien13",
								"alien14","alien15","alien16","alien17"],
							"fail_stage_index": 44
			}}}}],
				"bg_image": "res://asset/bgim/pw_inship.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	102 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S124L1"},
				{"name":"N_AS","avatar":true,"image":"res://asset/main_character/AS/avatar.png","dialogue":"S124L2"},
				{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/smile.png","dialogue":"S124L3"},
				{"name":"N_AS","avatar":true,"image":"res://asset/main_character/AS/smile_a.png","dialogue":"S124L4"},
				{"avatar":false,"dialogue":"S124L5"},
				{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S124L6"},
				{"avatar":false,"dialogue":"S124L7"}
			],
				"bg_image": "res://asset/bgim/pw_tstmt.png",
				"bg_music": "res://asset/music/stage/Mountain God's Shrine.ogg"
			}],
			"end_stage": "PTOWER"},
	103 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S125L1"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S125L2"},
			{"avatar":false,"dialogue":"S125L3"},
			{"avatar":false,"dialogue":"S125L4"},
			{"choices":{"index":0,
					"S125L5C1": {"next_stage_index": 104},
					"S125L5C2": {"next_stage_index": 105}
			}}],
				"bg_image": "res://asset/bgim/emperor_capital.png",
				"bg_music": "res://asset/music/stage/Revolve.ogg"
			}]},
	104 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S126L1"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S126L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S126L3"},
			{"avatar":true,"dialogue":"S126L4"},
			{"avatar":false,"dialogue":"S126L5"},
			{"avatar":true,"dialogue":"S126L6"},
			{"avatar":false,"dialogue":"S126L7"},
			{"avatar":true,"dialogue":"S126L8"},
			{"avatar":false,"dialogue":"S126L9"},
			{"avatar":true,"dialogue":"S126L10"},
			{"avatar":false,"dialogue":"S126L11"}],
				"bg_image": "res://asset/bgim/imperial_mtrmh.png",
				"bg_music": "res://asset/music/stage/InExtremis.ogg"
			},
			{"line":[
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S127L1"},
			{"avatar":false,"dialogue":"S127L2"}],
				"bg_image": "res://asset/bgim/imperial_palacewd.png"
			}],
			"end_stage": "NEMPEROR"
		},
	105 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S128L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S128L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S128L3"},
			{"avatar":true,"dialogue":"S128L4"},
			{"avatar":false,"dialogue":"S128L5"},
			{"avatar":true,"dialogue":"S128L6"},
			{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S128L7"},
			{"avatar":true,"dialogue":"S128L8"},
			{"choices":{"index":0,
					"S128L9C1": {"next_stage_index": 127},
					"S128L9C2": {"next_stage_index": 106}
			}}],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Rise Up The Sword.ogg"
			}]
		},
	106 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S129L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S129L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S129L3"},
			{"avatar":true,"dialogue":"S129L4"},
			{"avatar":false,"dialogue":"S129L5"},
			{"avatar":true,"dialogue":"S129L6"},
			{"avatar":false,"dialogue":"S129L7"}],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Let There Be Night.ogg"
			},
			{"line":[{"name":"N_LO","avatar":true,"image":"res://asset/avatar/lo.png","dialogue":"S130L1"},
			{"choices":{"index":0,
							"S130L2": {
								"next_stage_index": 112,
								"market":"super_market",
								"battle_field":{
									"basic_time": 240,
									"enemy_multiplier":1,
									"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
									"map":"res://asset/map/ip_def2.png",
									"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","enemy11","planet3","planet4"],
									"special_npc_list" : [{
										"name":"SNPC_ILG",
										"is_ally": false,
										"action_mode":1,
										"destroy_stage_index": 107
									}],
									"fail_stage_index": 112
				}}}}],
				"bg_image": "res://asset/bgim/imperial_mh.png"
			}]},
	107 : {"scenario_list" :
			[{"line":[{"name":"N_LO","avatar":true,"image":"res://asset/avatar/lo.png","dialogue":"S131L1"},
			{"choices":{"index":0,
				"S131L2": {
					"next_stage_index": 112,
					"market":"super_market",
					"battle_field":{
						"basic_time": 80,
						"enemy_multiplier":1,
						"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
						"map":"res://asset/map/ip_def3.png",
						"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","planet3","planet4"],
						"special_npc_list" : [{
							"name":"SNPC_IBGC",
							"is_ally": false,
							"action_mode":1,
							"destroy_stage_index": 108
						}],
						"fail_stage_index": 112
				}}}}],
				"bg_image": "res://asset/bgim/imperial_mh.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	108 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S133L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S133L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S133L3"},
			{"avatar":true,"dialogue":"S133L4"},
			{"avatar":false,"dialogue":"S133L5"},
			{"avatar":true,"dialogue":"S133L6"},
			{"choices":{"index":0,
				"S133L7": {
					"next_stage_index": 112,
					"market":"super_market",
					"battle_field":{
						"basic_time": 80,
						"enemy_multiplier":1,
						"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
						"map":"res://asset/map/al_cs.png",
						"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","planet4"],
						"special_npc_list" : [{
							"name":"SNPC_RB",
							"is_ally": false,
							"action_mode":1,
							"destroy_stage_index": 109
						}],
						"fail_stage_index": 112
				}}}},
			{"avatar":true,"dialogue":"S133L8"}
			],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Cursed City.ogg"
			}]
		},
	109 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S134L1"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S134L2"},
			{"name":"N_LO","avatar":true,"image":"res://asset/avatar/lo.png","dialogue":"S134L3"},
			{"choices":{"index":0,
				"S134L4": {
					"next_stage_index": 110,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":5,
						"battle_music":"res://asset/music/battle/Track6_Bonus1.ogg",
						"map":"res://asset/map/al_cs.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 112
				}}}}],
				"bg_image": "res://asset/bgim/pf_rb.png",
				"bg_music": "res://asset/music/stage/Sadness.ogg"
			}]
		},
	110 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S135L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S135L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S135L3"},
			{"avatar":true,"dialogue":"S135L4"},
			{"avatar":false,"dialogue":"S135L5"},
			{"avatar":true,"dialogue":"S135L6"},
			{"avatar":false,"dialogue":"S135L7"},
			{"avatar":true,"dialogue":"S135L8"},
			{"choices":{"index":0,
				"S135L9": {
					"next_stage_index": 111,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":5,
						"battle_music":"res://asset/music/battle/Track4.ogg",
						"map":"res://asset/map/al_ts.png",
						"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy13","enemy14",
								"enemy17","enemy18","planet1","planet2","planet4","planet8"],
						"fail_stage_index": 112
				}}}}
			],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Sand.ogg"
			}]
		},
	111 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S136L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S136L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S136L3"},
			{"avatar":true,"dialogue":"S136L4"},
			{"avatar":false,"dialogue":"S136L5"},
			{"avatar":true,"dialogue":"S136L6"},
			{"avatar":false,"dialogue":"S136L7"},
			{"avatar":true,"dialogue":"S136L8"},
			{"avatar":false,"dialogue":"S136L9"},
			{"avatar":true,"dialogue":"S136L10"},
			{"avatar":false,"dialogue":"S136L11"},
			{"avatar":true,"dialogue":"S136L12"},
			{"choices":{"index":0,
							"S136L13": {
								"next_stage_index": 112,
								"market":"super_market",
								"battle_field":{
									"basic_time": 120,
									"enemy_multiplier":2,
									"battle_music":"res://asset/music/battle/Battle-Vampire_loop.ogg",
									"map":"res://asset/map/ip_ztb.png",
									"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8","enemy9",
									"enemy10","enemy11","enemy12","enemy13","enemy14","enemy15","enemy16","enemy17","enemy18",
									"planet1","planet2","planet3","planet4","planet5","planet6","planet7","planet8","planet9"],
									"special_npc_list" : [{
										"name":"SNPC_ZD",
										"is_ally": false,
										"action_mode":1,
										"destroy_stage_index": 113
									}],
									"fail_stage_index": 112
				}}}},
			{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S136L14"},
			],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Harbingers.ogg"
			}]
		},
	112 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S137L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S137L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S137L3"}],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Midnight Shadow.ogg"
			}],
			"end_stage": "NTOWER"
		},
	113 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S138L1"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S138L2"},
			{"choices":{"index":0,
					"S138L3C1": {"next_stage_index": 114},
					"S138L3C2": {"next_stage_index": 115, "req":{"K_INTELLIGENCE":75}}
			}}],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Harbingers.ogg"
			}]
		},
	114 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S139L1"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S139L2"},
			{"avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S139L3"},
			{"avatar":false,"dialogue":"S139L4"}
			],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/InExtremis.ogg"
			}],
			"end_stage" : "PDEVIL"
		},
	115 : {"scenario_list" :
			[{"line":[
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S140L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S140L2"},
			{"choices":{"index":0,
				"S140L3": {
					"next_stage_index": 116,
					"market":"super_market",
					"battle_field":{
						"basic_time": 120,
						"enemy_multiplier":1,
						"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
						"map":"res://asset/map/ip_emp.png",
						"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17","enemy18",
							"planet5","planet6","planet7","planet9"],
						"special_npc_list" : [{
							"name":"SNPC_EMP",
							"is_ally": false,
							"action_mode":0,
							"destroy_stage_index": 117
						}],
						"fail_stage_index": 116
				}}}},
			{"avatar":true,"dialogue":"S140L4"},
			],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Shamisen Samurai Rock.ogg"
			}]
		},
	116 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S141L1"}],
				"bg_image": "res://asset/bgim/imperial_palace.png",
				"bg_music": "res://asset/music/stage/Lonely Island.ogg"
			}],
			"end_stage" : "PDEVIL"
		},
	117 : {"scenario_list" :
			[{"line":[{"name":"N_IC","avatar":true,"image":"res://asset/main_character/IC/avatar.png","dialogue":"S142L1"},
			{"name":"N_NE","avatar":false,"image":"res://asset/main_character/NE/angry.png","dialogue":"S142L2"}
			],
				"bg_image": "res://asset/bgim/imperial_palace_bd.png",
				"bg_music": "res://asset/music/stage/MemoryBox.ogg"
			}],
			"end_stage" : "NWHEEL"
		},
	118 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S143L1"},
			{"avatar":true,"name":"N_ZD","image":"res://asset/avatar/zd.png","dialogue":"S143L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S143L3"},
			{"avatar":true,"dialogue":"S143L4"},
			{"avatar":false,"dialogue":"S143L5"},
			{"avatar":true,"dialogue":"S143L6"},
			{"avatar":false,"dialogue":"S143L7"},
			{"avatar":true,"dialogue":"S143L8"},
			{"avatar":false,"dialogue":"S143L9"},
			{"avatar":true,"dialogue":"S143L10"},
			{"avatar":false,"dialogue":"S143L11"}
			],
				"bg_image": "res://asset/bgim/imperial_mtrmh.png",
				"bg_music": "res://asset/music/stage/Ice River.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S144L1"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S144L2"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S144L3"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L4"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S144L5"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L6"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S144L7"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L8"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S144L9"},
			{"avatar":true,"dialogue":"S144L10"},
			{"avatar":false,"dialogue":"S144L11"},
			{"avatar":true,"dialogue":"S144L12"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S144L13"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L14"},
			{"avatar":false,"dialogue":"S144L15"},
			{"avatar":true,"dialogue":"S144L16"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S144L17"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L18"},
			{"avatar":false,"dialogue":"S144L19"},
			{"avatar":true,"dialogue":"S144L20"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S144L21"},
			{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S144L22"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L23"},
			{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S144L24"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L25"},
			{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S144L26"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S144L27"},
			{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S144L28"},
			{"choices":{"index":0,
					"S144L29C1": {"next_stage_index": 119},
					"S144L29C2": {"next_stage_index": 120, "req":{"K_INTELLIGENCE":40}}
			}}],
				"bg_image": "res://asset/bgim/imperial_palace_fah.png",
				"bg_music": "res://asset/music/stage/Old Forest.ogg"
			},
			]
		},
	119 : {"scenario_list" :
			[{"line":[{"name":"N_ZTB","avatar":true,"image":"res://asset/avatar/ztb.png","dialogue":"S145L1"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S145L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S145L3"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S145L4"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S145L5"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S145L6"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S145L7"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S145L8"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S145L9"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S145L10"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S145L11"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S145L12"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S145L13"},
			{"name":"N_JF","avatar":true,"image":"res://asset/avatar/jf.png","dialogue":"S145L14"},
			],
				"bg_image": "res://asset/bgim/imperial_palace_fah.png",
				"bg_music": "res://asset/music/stage/Ancient Woods.ogg"
			}],
			"next_stage_index": 127
		},
	120 : {"scenario_list" :
			[{"line":[{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S146L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S146L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S146L3"},
			{"avatar":true,"dialogue":"S146L4"},
			{"avatar":false,"dialogue":"S146L5"},
			{"avatar":true,"dialogue":"S146L6"},
			{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S146L7"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S146L8"},
			{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S146L9"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S146L10"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S146L11"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S146L12"},
			{"avatar":false,"dialogue":"S146L13"},
			{"rewards": {"index":0,
					"S146L14R1":{"K_AFFINITY": 10},
					"S146L14R2":{"K_SANITY": 10}
			}},
			{"name":"N_ZJY","avatar":true,"image":"res://asset/avatar/zjy.png","dialogue":"S146L15"},
			{"avatar":false,"dialogue":"S146L16"}],
				"bg_image": "res://asset/bgim/imperial_palace_fah.png",
				"bg_music": "res://asset/music/stage/Drunken Captain.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S147L1"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S147L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S147L3"},
			{"avatar":true,"dialogue":"S147L4"},
			{"choices":{
						"index":0,
						"S147L5": {
							"next_stage_index": 44,
							"market":"super_market",
							"battle_field":{
								"basic_time": 120,
								"enemy_multiplier":1,
								"battle_music":"res://asset/music/battle/War_of_Exploding_Mountains.ogg",
								"map":"res://asset/map/al_ff.png",
								"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","planet1","planet2"],
								"fail_stage_index": 44,
								"special_npc_list" : [{
									"name":"SNPC_FF",
									"is_ally": false,
									"action_mode":0,
									"destroy_stage_index": 121
									}],
			}}}}],
				"bg_image": "res://asset/bgim/al_pff.png",
				"bg_music": "res://asset/music/stage/Cursed Sea.ogg"
			}]
		},
	121 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S148L1"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S148L2"},
			{"choices":{
						"index":0,
						"S148L3": {
							"next_stage_index": 44,
							"market":"super_market",
							"battle_field":{
								"basic_time": 120,
								"enemy_multiplier":1,
								"battle_music":"res://asset/music/battle/Battle-Grief_loop.ogg",
								"map":"res://asset/map/al_hp.png",
								"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet1","planet2"],
								"fail_stage_index": 44,
								"special_npc_list" : [{
									"name":"SNPC_HP",
									"is_ally": false,
									"action_mode":0,
									"destroy_stage_index": 122
									}],
			}}}}],
				"bg_image": "res://asset/bgim/al_pff.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	122 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S149L1"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S149L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S149L3"},
			{"avatar":true,"dialogue":"S149L4"},
			{"avatar":false,"dialogue":"S149L5"},
			{"avatar":true,"dialogue":"S149L6"},
			{"avatar":false,"dialogue":"S149L7"},
			{"avatar":true,"dialogue":"S149L8"},
			{"choices":{
						"index":0,
						"S149L9": {
							"next_stage_index": 44,
							"market":"super_market",
							"battle_field":{
								"basic_time": 120,
								"enemy_multiplier":1,
								"battle_music":"res://asset/music/battle/Battle-Conflict_loop.ogg",
								"map":"res://asset/map/al_fh.png",
								"enemy_list" : ["enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","planet2","planet4"],
								"fail_stage_index": 44,
								"special_npc_list" : [{
									"name":"SNPC_FH",
									"is_ally": false,
									"action_mode":0,
									"destroy_stage_index": 123
									}],
			}}}}
			],
				"bg_image": "res://asset/bgim/al_pff.png",
				"bg_music": "res://asset/music/stage/Drunken Captain.ogg"
			}]
		},
	123 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S150L1"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S150L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S150L3"},
			{"avatar":true,"dialogue":"S150L4"},
			{"avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S150L5"},
			{"avatar":true,"dialogue":"S150L6"},
			{"avatar":false,"dialogue":"S150L7"},
			{"avatar":true,"dialogue":"S150L8"},
			{"avatar":false,"dialogue":"S150L9"},
			{"choices":{
				"index":0,
				"S150L10": {
					"next_stage_index": 124,
					"market":"super_market",
					"battle_field":{
						"basic_time": 80,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
						"map":"res://asset/map/al_pa.png",
						"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14",
							"enemy17","enemy18","planet1","planet2","planet4","planet8"],
							"fail_stage_index": 23,
							"special_npc_list" : [{
								"name":"SNPC_PA","is_ally": false,"action_mode":0}],
			}}}}
			],
				"bg_image": "res://asset/bgim/al_pff.png",
				"bg_music": "res://asset/music/stage/InExtremis.ogg"
			}]
		},
	124 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S151L1"},
			{"name":"N_HK","avatar":true,"image":"res://asset/avatar/hk.png","dialogue":"S151L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S151L3"},
			{"avatar":true,"dialogue":"S151L4"},
			{"avatar":false,"dialogue":"S151L5"},
			{"avatar":true,"dialogue":"S151L6"},
			{"avatar":false,"dialogue":"S151L7"},
			{"avatar":true,"dialogue":"S151L8"},
			{"avatar":false,"dialogue":"S151L9"},
			{"avatar":true,"dialogue":"S151L10"},
			{"avatar":false,"dialogue":"S151L11"},
			{"avatar":true,"dialogue":"S151L12"},
			{"avatar":false,"dialogue":"S151L13"},
			{"avatar":true,"dialogue":"S151L14"},
			{"avatar":false,"dialogue":"S151L15"},
			{"avatar":true,"dialogue":"S151L16"},
			{"avatar":false,"dialogue":"S151L17"},
			{"avatar":true,"dialogue":"S151L18"},
			{"avatar":false,"dialogue":"S151L19"},
			{"avatar":true,"dialogue":"S151L20"},
			{"choices":{
				"index":0,
				"S151L21C1": {"next_stage_index": 54},
				"S151L21C2": {"next_stage_index": 125}
				}}
			],
				"bg_image": "res://asset/bgim/emperor_capital.png",
				"bg_music": "res://asset/music/stage/Revolve.ogg"
			}]
		},
	125 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S152L1"},
			{"name":"N_EMP","avatar":true,"image":"res://asset/avatar/emp.png","dialogue":"S152L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S152L3"}],
				"bg_image": "res://asset/bgim/emperor_capital.png",
				"bg_music": "res://asset/music/stage/Rising Sun.ogg"
			}],
			"end_stage": "PCHARIOT"
		},
	126 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S153L1"},
			{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S153L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S153L3"},
			{"avatar":true,"dialogue":"S153L4"},
			{"avatar":false,"dialogue":"S153L5"},
			{"avatar":true,"dialogue":"S153L6"},
			{"avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S153L7"},
			{"avatar":true,"dialogue":"S153L8"},
			{"avatar":false,"dialogue":"S153L9"}
			],
				"bg_image": "res://asset/bgim/imperial_mtrmh.png",
				"bg_music": "res://asset/music/stage/Drunken Captain.ogg"
			}],
			"next_stage_index": 127,
		},
	127 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S154L1"},
			{"name":"N_XZ","avatar":true,"image":"res://asset/avatar/xz.png","dialogue":"S154L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S154L3"},
			{"avatar":true,"dialogue":"S154L4"},
			{"avatar":false,"dialogue":"S154L5"},
			{"avatar":true,"dialogue":"S154L6"},
			{"avatar":false,"dialogue":"S154L7"},
			{"avatar":true,"dialogue":"S154L8"},
			{"avatar":false,"dialogue":"S154L9"},
			{"avatar":true,"dialogue":"S154L10"},
			{"avatar":false,"dialogue":"S154L11"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S154L12"},
			{"avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S154L13"},
			{"avatar":true,"dialogue":"S154L14"},
			{"avatar":false,"dialogue":"S154L15"},
			{"avatar":true,"dialogue":"S154L16"},
			{"avatar":false,"dialogue":"S154L17"},
			{"avatar":true,"dialogue":"S154L18"},
			{"avatar":false,"dialogue":"S154L19"},
			{"avatar":true,"dialogue":"S154L20"},
			{"avatar":false,"dialogue":"S154L21"},
			{"avatar":true,"dialogue":"S154L22"},
			{"avatar":false,"dialogue":"S154L23"},
			{"avatar":true,"dialogue":"S154L24"},
			{"choices":{
				"index":0,
				"S154L25C1": {"next_stage_index": 128},
				"S154L25C2": {"next_stage_index": 129}
				}}
			],
				"bg_image": "res://asset/bgim/imperial_prison.png",
				"bg_music": "res://asset/music/stage/Cursed City.ogg"
			}]
		},
	128 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S155L1"}],
				"bg_image": "res://asset/bgim/imperial_prison.png",
				"bg_music": "res://asset/music/stage/InLoneliness.ogg"
			}],
			"end_stage": "NHANGMAN"
		},
	129 : {"scenario_list" :
			[{"line":[{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S156L1"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S156L2"},
			{"avatar":true,"dialogue":"S156L3"},
			{"avatar":false,"dialogue":"S156L4"}
			],
				"bg_image": "res://asset/bgim/imperial_prison.png",
				"bg_music": "res://asset/music/stage/Risel.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S157L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S157L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S157L3"},
			{"avatar":true,"dialogue":"S157L4"},
			{"avatar":false,"dialogue":"S157L5"},
			{"avatar":true,"dialogue":"S157L6"},
			{"choices":{
				"index":0,
				"S157L7C1": {"next_stage_index": 45},
				"S157L7C2": {"next_stage_index": 130}
			}}],
				"bg_image": "res://asset/bgim/imperial_ugslums.png",
				"bg_music": "res://asset/music/stage/Flying.ogg"
			},
			]
		},
	130 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S158L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S158L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S158L3"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S158L4"},
			{"name":"N_WE","avatar":true,"image":"res://asset/avatar/we.png","dialogue":"S158L5"}
			],
				"bg_image": "res://asset/bgim/pf_rb.png",
				"bg_music": "res://asset/music/stage/Sky City.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S159L1"},
			{"name":"N_WE","avatar":true,"image":"res://asset/avatar/we.png","dialogue":"S159L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S159L3"},
			{"rewards": {"index":0,
					"S159L4R1":{"K_INTELLIGENCE": 10},
					"S159L4R2":{"K_AFFINITY": 10}
				}},
			{"avatar":true,"dialogue":"S159L5"},
			{"avatar":false,"dialogue":"S159L6"},
			{"avatar":true,"dialogue":"S159L7"},
			{"avatar":false,"dialogue":"S159L8"},
			{"avatar":true,"dialogue":"S159L9"},
			{"avatar":false,"dialogue":"S159L10"},
			{"avatar":true,"dialogue":"S159L11"}],
				"bg_image": "res://asset/bgim/pf_rbat.png"
			},
			{"line":[{"avatar":false,"dialogue":"S160L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S160L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S160L3"},
			{"avatar":true,"dialogue":"S160L4"},
			{"avatar":false,"dialogue":"S160L5"},
			{"avatar":true,"dialogue":"S160L6"},
			{"avatar":false,"dialogue":"S160L7"},
			{"avatar":true,"dialogue":"S160L8"},
			{"choices":{"index":1,
					"S160L9C1": {
						"next_stage_index": 132,
						"market":"neutral_market1",
						"battle_field":{
							"basic_time": 40,
							"enemy_multiplier":3,
							"battle_music":"res://asset/music/battle/BGM07battle4.wav",
							"map":"res://asset/map/pf.png",
							"enemy_list" : ["enemy3","enemy4","enemy7","enemy8"],
							"fail_stage_index": 44},
						
					},
					"S160L9C2": {
						"next_stage_index": 131
				}}},
			{"avatar":true,"dialogue":"S160L10"},
			],
				"bg_image": "res://asset/bgim/pf_rb.png",
				"bg_music": "res://asset/music/stage/Revolve.ogg"
			}]
		},
	131 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S161L1"}],
				"bg_image": "res://asset/bgim/pf_rb.png",
				"bg_music": "res://asset/music/stage/InLoneliness.ogg"
			}],
			"end_stage": "NHANGMAN"
		},
	132 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S162L1"},
			{"name":"N_WE","avatar":true,"image":"res://asset/avatar/we.png","dialogue":"S162L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S162L3"},
			{"avatar":true,"dialogue":"S162L4"},
			{"rewards": {"index":0,
					"S162L5R1":{"K_SANITY": 10},
					"S162L5R2":{"item": "LIGHT_ORE"}
				}},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S162L6"},
			{"avatar":false,"dialogue":"S162L7"}
			],
				"bg_image": "res://asset/bgim/pf_rbbar.png",
				"bg_music": "res://asset/music/stage/MechanicalDancer.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S163L1"},
			{"name":"N_M","avatar":true,"image":"res://asset/avatar/m.png","dialogue":"S163L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/eyes_closed.png","dialogue":"S163L3"},
			{"avatar":true,"dialogue":"S163L4"},
			{"choices":{"index":1,
				"S163L5": {
					"next_stage_index": 133,
					"market":"neutral_market1",
					"battle_field":{
						"basic_time": 80,
						"enemy_multiplier":1,
						"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
						"map":"res://asset/map/pf.png",
						"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","planet3","planet4"],
						"special_npc_list" : [
						{"name":"SNPC_ILG","is_ally": false,"action_mode":0}],
						"fail_stage_index": 44,
			}}}},
			{"avatar":true,"dialogue":"S163L6"}
			],
				"bg_image": "res://asset/bgim/pf_rbbar2.png",
				"bg_music": "res://asset/music/stage/Well-knownToMyHeart.ogg"
			}]
		},
	133 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S164L1"},
			{"name":"N_M","avatar":true,"image":"res://asset/avatar/m.png","dialogue":"S164L2"},
			{"name":"N_WE","avatar":true,"image":"res://asset/avatar/we.png","dialogue":"S164L3"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S164L4"},
			{"avatar":true,"dialogue":"S164L5"},
			{"name":"N_M","avatar":true,"image":"res://asset/avatar/m.png","dialogue":"S164L6"},
			{"avatar":false,"dialogue":"S164L7"},
			{"avatar":false,"dialogue":"S164L8"}
			],
				"bg_image": "res://asset/bgim/pf_rbbar.png",
				"bg_music": "res://asset/music/stage/Dream Sakura.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S165L1"},
			{"name":"N_M","avatar":true,"image":"res://asset/avatar/m.png","dialogue":"S165L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_smile.png","dialogue":"S165L3"},
			{"avatar":true,"dialogue":"S165L4"},
			{"avatar":false,"dialogue":"S165L5"}
			],
				"bg_image": "res://asset/bgim/pf_bedroom.png"
			}],
			"next_stage_index": 134,
		},
	134 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S166L1"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S166L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/mouth_frown.png","dialogue":"S166L3"}
			],
				"bg_image": "res://asset/bgim/pf_rb.png",
				"bg_music": "res://asset/music/stage/Snowfall.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S167L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S167L2"},
			{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S167L3"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S167L4"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S167L5"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S167L6"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S167L7"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S167L8"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S167L9"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S167L10"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S167L11"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S167L12"},
			{"avatar":false,"dialogue":"S167L13"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S167L14"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S167L15"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S167L16"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S167L17"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S167L18"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S167L19"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S167L20"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S167L21"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S167L22"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S167L23"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S167L24"},
			{"avatar":false,"dialogue":"S167L25"},
			{"avatar":true,"dialogue":"S167L26"},
			{"avatar":false,"dialogue":"S167L27"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S167L28"},
			{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S167L29"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S167L30"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S167L31"},
			{"avatar":false,"dialogue":"S167L32"},
			{"choices":{"index":0,
					"S167L33C1": {
						"next_stage_index": 135
					},
					"S167L33C2": {
						"next_stage_index": 136
				}}}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/The Team.ogg"
			}]
		},
	135 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S168L1"},
			{"avatar":false,"dialogue":"S168L2"}],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Sand.ogg"
			}],
			"end_stage": "NHANGMAN"
		},
	136 : {"scenario_list" :
			[{"line":[{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S169L1"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S169L2"},
			{"avatar":true,"dialogue":"S169L3"},
			{"avatar":false,"dialogue":"S169L4"},
			{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S169L5"},
			{"avatar":false,"dialogue":"S169L6"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S169L7"},
			{"avatar":false,"dialogue":"S169L8"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S169L9"},
			{"avatar":false,"dialogue":"S169L10"},
			{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S169L11"},
			{"avatar":false,"dialogue":"S169L12"},
			{"avatar":true,"dialogue":"S169L13"},
			{"avatar":false,"dialogue":"S169L14"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S169L15"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S169L16"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S169L17"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S169L18"},
			{"avatar":false,"dialogue":"S169L19"},
			{"avatar":true,"dialogue":"S169L20"},
			{"choices":{"index":0,
				"S169L21C1": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/BGM07battle3.wav",
						"map":"res://asset/map/neu.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}},
				"S169L21C2": {"next_stage_index": 138,
						"market":"alliance_market3"},
				"S169L21C3": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/BGM07battle2.wav",
						"map":"res://asset/map/ip_ht.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}},
				"S169L21C4": {
					"next_stage_index": 147,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/BGM07battle1.wav",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","planet3","planet4","planet6","planet7"],
						"fail_stage_index": 146
				}}}},
			{"avatar":true,"dialogue":"S169L22"}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Time for Sacrifice.ogg"
			}]
		},
	137 : {"scenario_list" :
			[{"line":[{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S170L1"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S170L2"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S170L3"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S170L4"},
			{"choices":{"index":0,
				"S170L5C1": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
						"map":"res://asset/map/gs_pr.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}},
				"S170L5C2": {"next_stage_index": 138,
						"market":"alliance_market3"},
				"S170L5C3": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Track7_Bonus2.ogg",
						"map":"res://asset/map/ip_ht.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}},
				"S170L5C4": {
					"next_stage_index": 147,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Track6_Bonus1.ogg",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","planet3","planet4","planet6","planet7"],
						"fail_stage_index": 146
				}}}},
			{"avatar":true,"dialogue":"S170L6"}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Leave The Port.ogg"
			}]
		},
	138 : {"scenario_list" :
			[{"line":[{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S171L1"},
			{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S171L2"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S171L3"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S171L4"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S171L5"},
			{"choices":{"index":0,
				"S171L6C1": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/Track4.ogg",
						"map":"res://asset/map/neu.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}},
				"S171L6C2": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/BGM07battle4.wav",
						"map":"res://asset/map/ip_ht.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}},
				"S171L6C3": {
					"next_stage_index": 147,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/BGM07battle3.wav",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","planet3","planet4","planet6","planet7"],
						"fail_stage_index": 146
				}}}},
			{"avatar":true,"dialogue":"S171L7"}],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	139 : {"scenario_list" :
			[{"line":[{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S172L1"},
				{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S172L2"},
				{"choices":{"index":0,
				"S172L3": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/BGM07battle2.wav",
						"map":"res://asset/map/neu.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}}}}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Rise Up The Sword.ogg"
			}]
		},
	140 : {"scenario_list" :
			[{"line":[{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S173L1"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S173L2"},
			{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S173L3"},
			{"choices":{"index":0,
				"S173L4C1": {
					"next_stage_index": 141,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":1,
						"battle_music":"res://asset/music/battle/Battle-SAMURAI_loop.ogg",
						"map":"res://asset/map/ip_def.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"special_npc_list" : [{
								"name":"SNPC_HS",
								"is_ally": false,
								"action_mode":0}],
						"fail_stage_index": 44
				}},
				"S173L4C2": {"next_stage_index": 142,
						"req":{"K_INTELLIGENCE": 50,"K_AFFINITY": 50}}}}
			],
				"bg_image": "res://asset/bgim/res_planet.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	141 : {"scenario_list" :
			[{"line":[{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S174L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S174L2"},
			{"choices":{"index":0,
				"S174L3C1": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/BGM07battle1.wav",
						"map":"res://asset/map/neu.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}},
				"S174L3C2": {"next_stage_index": 138,
						"market":"alliance_market3"},
				"S174L3C3": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
						"map":"res://asset/map/ip_ht.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}},
				"S174L3C4": {
					"next_stage_index": 147,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Track7_Bonus2.ogg",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","planet3","planet4","planet6","planet7"],
						"fail_stage_index": 146
				}}}}
			],
				"bg_image": "res://asset/bgim/res_planet.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	142 : {"scenario_list" :
			[{"line":[{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S175L1"},
			{"name":"N_HSC","avatar":true,"image":"res://asset/avatar/hsc.png","dialogue":"S174L2"},
			{"avatar":false,"dialogue":"S175L3"},
			{"avatar":true,"dialogue":"S175L4"},
			{"choices":{"index":0,
					"S175L5C1": {
						"next_stage_index": 143
					},
					"S175L5C2": {
						"next_stage_index": 144,
						"req":{"K_ELOQUENCY": 100, "K_AFFINITY": 100},
			}}}
			],
				"bg_image": "res://asset/bgim/res_planet.png",
				"bg_music": "res://asset/music/stage/Risel.ogg"
			}]
		},
	143 : {"scenario_list" :
			[{"line":[{"name":"N_HSC","avatar":true,"image":"res://asset/avatar/hsc.png","dialogue":"S176L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S176L2"},
			{"choices":{"index":0,
				"S174L3C1": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/Track6_Bonus1.ogg",
						"map":"res://asset/map/gs_pr.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}},
				"S174L3C2": {"next_stage_index": 138,
						"market":"alliance_market3"},
				"S174L3C3": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Track4.ogg",
						"map":"res://asset/map/al_cs.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}},
				"S174L3C4": {
					"next_stage_index": 147,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/BGM07battle4.wav",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","planet3","planet4","planet6","planet7"],
						"fail_stage_index": 146
				}}}},
			],
				"bg_image": "res://asset/bgim/res_planet.png",
				"bg_music": "res://asset/music/stage/Ready For A Battle.ogg"
			}]
		},
	144 : {"scenario_list" :
			[{"line":[{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S177L1"},
			{"name":"N_HSC","avatar":true,"image":"res://asset/avatar/hsc.png","dialogue":"S177L2"},
			{"name":"N_TRP","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S177L3"},
			{"choices":{"index":1,
					"S177L4": {
						"next_stage_index": 44,
						"market":"super_market",
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":3,
							"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
							"map":"res://asset/map/ip_emp.png",
							"enemy_list" : ["enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8","enemy9","enemy10",
							"enemy11","enemy12","enemy13","enemy14","enemy15","enemy16","enemy17","enemy18","planet1","planet2",
								"planet3","planet4","planet5","planet6","planet7","planet8","planet9"],
							"special_npc_list" : [
								{"name":"SNPC_ZJY","is_ally": false,"action_mode":0},
								{"name":"SNPC_ZTB","is_ally": false,"action_mode":0},
								{"name":"SNPC_ZD","is_ally": false,"action_mode":0},
								{"name":"SNPC_ALG","is_ally": false,"action_mode":0},
								{"name":"SNPC_ARG","is_ally": false,"action_mode":0},
								{"name":"SNPC_ILG","is_ally": false,"action_mode":0},
								{"name":"SNPC_IRG","is_ally": false,"action_mode":0},
								{"name":"SNPC_IBGC","is_ally": false,"action_mode":0},
								{"name":"SNPC_EMP","is_ally": false,
								"action_mode":0,"destroy_stage_index": 145},
							{"name":"SNPC_HS",
								"is_ally": true,
								"action_mode":0}
							],
							"fail_stage_index": 44
				}}}}
			],
				"bg_image": "res://asset/bgim/res_planet.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	145 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S178L1"}],
				"bg_image": "res://asset/bgim/pstrength.png",
				"bg_music": "res://asset/music/stage/The Light.ogg"
			}],
			"end_stage": "PSTRENGTH"
		},
	146 : {"scenario_list" :
			[{"line":[{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S179L1"},
			{"choices":{"index":0,
				"S179L2": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/BGM07battle3.wav",
						"map":"res://asset/map/al_cs.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}}}},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S179L3"}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Time for Sacrifice.ogg"
			}]
		},
	147 : {"scenario_list" :
			[{"line":[{"name":"N_LZ","avatar":true,"image":"res://asset/avatar/lz.png","dialogue":"S180L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S180L2"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S180L3"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S180L4"},
			{"choices":{"index":1,
				"S180L5": {
					"next_stage_index": 149,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/BGM07battle2.wav",
						"map":"res://asset/map/ip_def.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11","enemy12","planet3","planet4","planet6","planet7"],
						"fail_stage_index": 146
				}}}}
			],
				"bg_image": "res://asset/bgim/mil_planet.png",
				"bg_music": "res://asset/music/stage/To The End.ogg"
			}]
		},
	148 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S181L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S181L2"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S181L3"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S181L4"},
			{"name":"N_IV","avatar":true,"image":"res://asset/avatar/iv.png","dialogue":"S181L5"},
			{"choices":{"index":0,
				"S181L6C1": {
					"next_stage_index": 137,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":2,
						"battle_music":"battle/BGM07battle1.wav",
						"map":"res://asset/map/neu.png",
						"enemy_list" : ["enemy1","enemy2","enemy3","enemy4"],
						"fail_stage_index": 44
				}},
				"S181L6C2": {"next_stage_index": 138,
						"market":"alliance_market3"},
				"S181L6C3": {
					"next_stage_index": 140,
					"market":"super_market",
					"battle_field":{
						"basic_time": 100,
						"enemy_multiplier":4,
						"battle_music":"res://asset/music/battle/Battle-Forbidden_SNES_loop.ogg",
						"map":"res://asset/map/pf.png",
						"enemy_list" :["enemy5","enemy6","enemy7","enemy8","planet3","planet4"],
						"fail_stage_index": 139
				}}}},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S181L7"},
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Time for Sacrifice.ogg"
			}]
		},
	149 : {"scenario_list" :
			[{"line":[{"choices":{"index":0,
				"S182L1": {
					"next_stage_index": 148,
					"market":"super_market",
					"battle_field":{
						"basic_time": 120,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","enemy11","planet3","planet4"],
						"special_npc_list" : [{"name":"SNPC_ILG","is_ally": false,
							"action_mode":0,"destroy_stage_index": 150}],
						"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/pf_rbbar.png",
				"bg_music": "res://asset/music/stage/MechanicalDancer.ogg"
			}]
		},
	150 : {"scenario_list" :
			[{"line":[{"choices":{"index":0,
				"S183L1": {
					"next_stage_index": 148,
					"market":"super_market",
					"battle_field":{
						"basic_time": 120,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/Battle-rapier_loop.ogg",
						"map":"res://asset/map/ip_def2.png",
						"enemy_list" : ["enemy3","enemy4","enemy7","enemy8","enemy11","planet1","planet4"],
						"special_npc_list" : [{"name":"SNPC_IRG","is_ally": false,
							"action_mode":0,"destroy_stage_index": 151}],
						"fail_stage_index": 44
				}}}}],
				"bg_image": "res://asset/bgim/mil_planet.png",
				"bg_music": "res://asset/music/stage/ToArms.ogg"
			}]
		},
	151 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S184L1"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S184L2"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S184L3"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S184L4"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S184L5"},
			{"name":"N_ZD","avatar":true,"image":"res://asset/avatar/zd.png","dialogue":"S184L6"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S184L7"},
			{"avatar":true,"dialogue":"S184L8"},
			{"avatar":false,"dialogue":"S184L9"},
			{"avatar":true,"dialogue":"S184L10"},
			{"avatar":false,"dialogue":"S184L11"},
			{"avatar":true,"dialogue":"S184L12"},
			{"avatar":false,"dialogue":"S184L13"},
			{"name":"N_TRP","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S184L14"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S184L15"},
			{"choices":{"index":0,
				"S184L16": {
					"next_stage_index": 148,
					"market":"super_market",
					"battle_field":{
						"basic_time": 120,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/Battle-Furious-GUITAR_loop.ogg",
						"map":"res://asset/map/ip_zjy.png",
						"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17",
							"planet5","planet6","planet7","planet9"],
						"special_npc_list" : [{
							"name":"SNPC_ZJY",
							"is_ally": false,
							"action_mode":0,
							"destroy_stage_index": 152
						}],
						"fail_stage_index": 44
			}}}}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Warfare.ogg"
			}]
		},
	152 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S185L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S185L2"},
			{"name":"N_M","avatar":true,"image":"res://asset/avatar/m.png","dialogue":"S185L3"}
			],
				"bg_image": "res://asset/bgim/pf_rbbarnew.png",
				"bg_music": "res://asset/music/stage/Ancient Woods.ogg"
			},
			{"line":[{"avatar":false,"dialogue":"S186L1"},
			{"name":"N_ZL","avatar":true,"image":"res://asset/avatar/zl.png","dialogue":"S186L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S186L3"},
			{"avatar":true,"dialogue":"S186L4"},
			{"avatar":false,"dialogue":"S186L5"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S186L6"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S186L7"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S186L8"},
			{"name":"N_ZM","avatar":true,"image":"res://asset/avatar/zm.png","dialogue":"S186L9"},
			{"name":"N_ZL","avatar":true,"image":"res://asset/avatar/zl.png","dialogue":"S186L10"},
			{"avatar":false,"dialogue":"S186L11"},
			{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S186L12"},
			{"name":"N_TRP","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S186L13"},
			{"choices":{"index":0,
					"S186L14": {
						"next_stage_index": 148,
						"market":"super_market",
						"battle_field":{
							"basic_time": 120,
							"enemy_multiplier":2,
							"battle_music":"res://asset/music/battle/Battle-Grief_loop.ogg",
							"map":"res://asset/map/ip_ztb.png",
							"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17","enemy18",
								"planet5","planet6","planet7","planet9"],
							"special_npc_list" : [{
								"name":"SNPC_ZTB",
								"is_ally": false,
								"action_mode":0,
								"destroy_stage_index": 153
							}],
							"fail_stage_index": 44
				}}}}
			],
				"bg_image": "res://asset/bgim/pf_rbmtrm.png",
				"bg_music": "res://asset/music/stage/Warriors.ogg"
			}]
		},
	153 : {"scenario_list" :
			[{"line":[{"name":"N_ZTZ","avatar":true,"image":"res://asset/avatar/ztz.png","dialogue":"S187L11"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S187L2"},
			{"avatar":true,"dialogue":"S187L3"},
			{"avatar":false,"dialogue":"S187L4"},
			{"avatar":true,"dialogue":"S187L5"},
			{"avatar":false,"dialogue":"S187L6"},
			{"avatar":true,"dialogue":"S187L7"},
			{"choices":{"index":0,
				"S186L14": {
					"next_stage_index": 148,
					"market":"super_market",
					"battle_field":{
						"basic_time": 120,
						"enemy_multiplier":2,
						"battle_music":"res://asset/music/battle/8bit-Battle01_loop.ogg",
						"map":"res://asset/map/ip_emp.png",
						"enemy_list" : ["enemy1","enemy2","enemy5","enemy6","enemy9","enemy10","enemy13","enemy14","enemy17","enemy18",
							"planet5","planet6","planet7","planet9"],
						"special_npc_list" : [{
							"name":"SNPC_EMP",
							"is_ally": false,
							"action_mode":0,
							"destroy_stage_index": 154
						}],
						"fail_stage_index": 44
			}}}}
			],
				"bg_image": "res://asset/bgim/pf_rbbarnew.png",
				"bg_music": "res://asset/music/stage/Rise Up The Sword.ogg"
			}]
		},
	154 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S188L1"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S188L2"},
			{"name":"N_IC","avatar":false,"image":"res://asset/main_character/IC/base.png","dialogue":"S188L3"},
			{"avatar":true,"dialogue":"S188L4"},
			{"name":"N_TRP","avatar":true,"image":"res://asset/avatar/npc.png","dialogue":"S188L5"},
			{"name":"N_JX","avatar":true,"image":"res://asset/avatar/jx.png","dialogue":"S188L6"},
			{"avatar":false,"dialogue":"S188L7"},
			{"choices":{
				"index":0,
				"S188L8C1": {
					"next_stage_index": 155
				},
				"S188L8C2": {
					"next_stage_index": 156
			}}},
			{"avatar":true,"dialogue":"S188L9"},
			{"avatar":false,"dialogue":"S188L10"},
			],
				"bg_image": "res://asset/bgim/imperial_palace_bqh.png",
				"bg_music": "res://asset/music/stage/Rising Sun.ogg"
			}]
		},
	155 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S189L1"}],
				"bg_image": "res://asset/bgim/nova_fps.png",
				"bg_music": "res://asset/music/stage/Birds Fly.ogg"
			}],
			"end_stage": "PCHARIOT"
		},
	156 : {"scenario_list" :
			[{"line":[{"avatar":false,"dialogue":"S190L1"}],
				"bg_image": "res://asset/bgim/nove_adm.png",
				"bg_music": "res://asset/music/stage/ATaleForTheJourney.ogg"
			}],
			"end_stage": "PEMPEROR"
		},


	}
}
