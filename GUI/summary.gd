extends CanvasLayer

@onready var background: TextureRect = $Background
@onready var bounty_count: Label = $BountyBox/BountyCount
@onready var main_character = $MainCharacter
@onready var summary = $Panel/MarginContainer/HBoxContainer/SummaryContainer/Panel/Summary
@onready var ach_img = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Panel/AchImg
@onready var owned_item_panel = $OwnedItemPanel
@onready var attr_panel: Panel = $AttrPanel
@onready var owned_weapon_panel = $OwnedWeaponPanel


const Attr_list = [
	"K_LV","K_ATK","K_ATK_INTVL","K_EXPL_RNG","K_EXPL_DMG","K_TP",
	"K_RICO","K_SPL","K_ACCURACY","K_CRIT_RATE"
]

const END_MAP:Dictionary = {
		"LMEND":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/ends/0-TheFool.png",
			"ach_img":"res://asset/ends/11-Justice.png",
			"flip":false
		},
		"SAN0":{
			"bg_img":"res://asset/ends/StarFieldF.png",
			"chr_img":"res://asset/ends/14-Temperance.png",
			"ach_img":"res://asset/ends/19-TheSun.png",
			"flip":true
		},
		"COMFE":{
			"bg_img":"res://asset/ends/StarFieldF.png",
			"chr_img":"res://asset/ends/1-TheMagician.png",
			"ach_img":"res://asset/ends/18-TheMoon.png",
			"flip":true
		},
		"PDEVIL":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/15-TheDevil.png",
			"flip":false
		},
		"NJUDGEMENT":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/20-Judgement.png",
			"flip":true
		},
		"PTOWER":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/16-TheTower.png",
			"flip":false
		},
		"NTOWER":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/16-TheTower.png",
			"flip":true
		},
		"NHERMIT":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/9-TheHermit.png",
			"flip":true
		},
		"PLOVERS":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/6-TheLovers.png",
			"flip":false
		},
		"NLOVERS":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/6-TheLovers.png",
			"flip":true
		},
		"PSTAR":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/17-TheStar.png",
			"flip":false
		},
		"NSTAR":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/17-TheStar.png",
			"flip":true
		},
		"PDEATH":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/13-Death.png",
			"flip":false
		},
		"NHANGMAN":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/12-HangedMan.png",
			"flip":true#the only 1
		},
		"PWORLD":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/21-TheWorld.png",
			"flip":false
		},
		"PSTRENGTH":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/8-Strength.png",
			"flip":false
		},
		"NSTRENGTH":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/8-Strength.png",
			"flip":true
		},
		"PEMPEROR":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/4-TheEmperor.png",
			"flip":false
		},
		"NEMPEROR":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/4-TheEmperor.png",
			"flip":true
		},
		"NWHEEL":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/10-WheelofFortune.png",
			"flip":true
		},
		"PCHARIOT":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/avatar.png",
			"ach_img":"res://asset/ends/7-TheChariot.png",
			"flip":false
		},
		"NCHARIOT":{
			"bg_img":"res://asset/ends/StarFieldS.png",
			"chr_img":"res://asset/main_character/IC/eyes_closed.png",
			"ach_img":"res://asset/ends/7-TheChariot.png",
			"flip":false
		}
	}

var end_dict = null

func init(end_stage):
	end_dict = END_MAP[end_stage]
	background.texture = load(end_dict["bg_img"])
	main_character.texture = load(end_dict["chr_img"])
	bounty_count.text = str(Playerstats.bounty_count)
	owned_item_panel.show_owned_items()
	owned_weapon_panel.show_owned_weapons(false)
	attr_panel.load_Playerstats_attr()
	summary.text = end_stage
	ach_img.texture = load(end_dict["ach_img"])
	ach_img.set_flip_v(end_dict["flip"])
	if Controller.steam_connected:
		var achi_status = Steam.getAchievement(end_stage)
		if achi_status['ret'] and not achi_status['achieved']:
			var _set_achievement: bool = Steam.setAchievement(end_stage)
			var _store_stats: bool = Steam.storeStats()
	#if Controller.epic_product_user_id != "":
		#var unlock_options = EOS.Achievements.UnlockAchievementsOptions.new()
		#unlock_options.user_id = Controller.epic_product_user_id
		#unlock_options.achievement_ids = [end_stage]
		#EOS.Achievements.AchievementsInterface.unlock_achievements(unlock_options)

func _on_bm_button_pressed():
	Controller.back_to_main()
