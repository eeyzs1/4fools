extends CanvasLayer

@onready var attr_panel: Panel = $AttrPanel
@onready var owned_item_panel = $OwnedItemPanel
@onready var owned_weapon_panel = $OwnedWeaponPanel

const Attr_list = [
	"K_LV","K_ATK","K_ATK_INTVL","K_EXPL_RNG","K_EXPL_DMG","K_TP",
	"K_RICO","K_SPL","K_ACCURACY","K_CRIT_RATE"
]

func init() -> void:
	attr_panel.load_Playerstats_attr()
	owned_weapon_panel.show_owned_weapons(false)
	owned_weapon_panel.update_column_num(5)
	owned_item_panel.show_owned_items()

func show_detail(attr_detail):
	attr_detail.show()

func hide_detail(attr_detail):
	attr_detail.hide()

func _on_exit_button_pressed() -> void:
	Controller.exit_game()


func _on_continue_button_pressed() -> void:
	Controller.continue_game()


func _on_back_main_button_pressed() -> void:
	Controller.back_to_main()


func _on_restart_button_pressed() -> void:
	Controller.restart_battle()


func _on_sl_button_pressed() -> void:
	Controller.load_save_game()


func _on_setting_button_pressed() -> void:
	Controller.show_settings()
