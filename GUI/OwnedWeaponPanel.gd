extends Panel
@onready var owned_weapon_container = $ScrollContainer/OwnedWeaponContainer
@onready var scroll_container = $ScrollContainer

const owned_weapon_window = preload("res://GUI/owned_weapon_window.tscn")
const Attr_list = [
	"K_LV","K_ATK","K_ATK_INTVL","K_EXPL_RNG","K_EXPL_DMG","K_TP",
	"K_RICO","K_SPL","K_ACCURACY","K_CRIT_RATE"
]
var owb_ls = []
var oww_inst_length

signal switch_mask_panel()

func _ready():
	var v_scroll_bar = scroll_container.get_v_scroll_bar()
	v_scroll_bar.scrolling.connect(scrolling_weapons)
	var inst = owned_weapon_window.instantiate()
	owned_weapon_container.add_child(inst)
	inst.show()
	oww_inst_length = inst.size.y
	inst.queue_free()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			scrolling_weapons()

func scrolling_weapons():
	var scrolled_length = scroll_container.scroll_vertical
	var item_length = oww_inst_length
	var grid_columns = owned_weapon_container["columns"]
	var v_seperation = owned_weapon_container["theme_override_constants/v_separation"]
	var transparent_rows = int(scrolled_length)/((int)(item_length + v_seperation))
	var min_uv = float(scrolled_length%((int)(item_length + v_seperation)))/float(item_length)
	var last_full_transparent_index = grid_columns*transparent_rows
	var last_part_transparent_index = last_full_transparent_index + grid_columns
	var owws = owned_weapon_container.get_children()
	
	for i in range(0, len(owws)):
		if i < last_full_transparent_index:
			owws[i].get_material().set_shader_parameter("min_uv", Vector2(1.0, 1.0))
			owws[i].get_node("OwnedWeaponButton").get_material().set_shader_parameter("min_uv", Vector2(1.0, 1.0))
		elif i < last_part_transparent_index:
			owws[i].get_material().set_shader_parameter("min_uv", Vector2(0.0, min_uv))
			owws[i].get_node("OwnedWeaponButton").get_material().set_shader_parameter("min_uv", Vector2(0.0, min_uv))
		else:
			owws[i].get_material().set_shader_parameter("min_uv", Vector2(0.0, 0.0))
			owws[i].get_node("OwnedWeaponButton").get_material().set_shader_parameter("min_uv", Vector2(0.0, 0.0))

func update_column_num(num):
	owned_weapon_container["columns"] = num

func show_owned_weapons(enable_ops):
	if owned_weapon_container.get_child_count() != 0:
		owb_ls = []
		var owcs = owned_weapon_container.get_children()
		for i in range(0, len(owcs)):
			owned_weapon_container.remove_child(owcs[i])
			owcs[i].queue_free()

	for i in range(0, Playerstats.weapon_list.size()):
		var weapon_data = Playerstats.weapon_list[i]
		show_weapon(i, weapon_data, enable_ops)
	scrolling_weapons()

func show_weapon(i, weapon_data, enable_ops):
	var noww = owned_weapon_window.instantiate()
	var attr_box = noww.get_node("WeaponPanel/WeaponDetail/AttrBox")
	var attr_text  = attr_box.get_node("WeaponAttrText")
	var weapon_panel = noww.get_node("WeaponPanel")
	var nowb = noww.get_node("OwnedWeaponButton")
	var weapon_detail = noww.get_node("WeaponPanel/WeaponDetail")
	var weapon_lv = weapon_data["K_LV"]
	owned_weapon_container.add_child(noww)
	noww.show()
	noww.texture = load(weapon_data["K_IMG"])
	noww.get_node("OwnedWeaponButton").get_material().set_shader_parameter("bg_color", WeaponSetting.weapons_level_color[weapon_lv])
	noww.get_node("WeaponPanel/WeaponDetail/OverviewBox/Panel/WeaponTexture").texture = load(weapon_data["K_IMG"])
	noww.get_node("WeaponPanel/WeaponDetail/OverviewBox/Panel")["self_modulate"] = WeaponSetting.weapons_level_color[weapon_lv]
	noww.get_node("WeaponPanel/WeaponDetail/OverviewBox/WeaponName").text = tr(weapon_data["K_WEAPON_NAME"])
	for k in Attr_list:
		if weapon_data[k] != 0:
			var new_attr_text = attr_text.duplicate()
			new_attr_text.text = tr(k) + "  " + str(weapon_data[k])
			attr_box.add_child(new_attr_text)
	nowb.mouse_entered.connect(show_detail.bind(weapon_panel))
	nowb.mouse_exited.connect(hide_detail.bind(weapon_panel))
	if enable_ops:
		nowb.pressed.connect(show_op_weapon.bind(weapon_panel))
		owb_ls.append(nowb)
		var op_button = noww.get_node("WeaponPanel/WeaponDetail/OpButton")
		var synthesis_list = []
		if weapon_data["K_LV"] < 4:
			for j in range(0, Playerstats.weapon_list.size()):
				if weapon_data["K_WEAPON_NAME"] ==  Playerstats.weapon_list[j]["K_WEAPON_NAME"] and weapon_data["K_LV"] ==  Playerstats.weapon_list[j]["K_LV"] and j != i:
					synthesis_list.append(j)
		if synthesis_list.size() > 0:
			var nob_syn = op_button.duplicate()
			nob_syn.text = tr("K_SYNTHESIS")
			weapon_detail.add_child(nob_syn)
			nob_syn.show()
			nob_syn.pressed.connect(synthesis_weapon.bind(i))
		var nob_sell = op_button.duplicate()
		var price = weapon_data["K_PRICE"]*pow(2,weapon_lv-1)
		nob_sell.text = tr("K_SELL") + "(" + str(price) + ")"
		weapon_detail.add_child(nob_sell)
		nob_sell.show()
		nob_sell.pressed.connect(sell_weapon.bind(i))
		var nob_cancel = op_button.duplicate()
		nob_cancel.text = tr("K_CANCEL")
		weapon_detail.add_child(nob_cancel)
		nob_cancel.show()
		nob_cancel.pressed.connect(hide_op_weapon.bind(weapon_panel))

func buy_weapon(weapon_data):
	var new_weapon_index= Playerstats.weapon_list.size()
	Playerstats.add_weapon(weapon_data)
	var noww = owned_weapon_window.instantiate()
	var attr_box = noww.get_node("WeaponPanel/WeaponDetail/AttrBox")
	var attr_text  = attr_box.get_node("WeaponAttrText")
	var weapon_panel = noww.get_node("WeaponPanel")
	var nowb = noww.get_node("OwnedWeaponButton")
	var weapon_detail = noww.get_node("WeaponPanel/WeaponDetail")
	var weapon_lv = weapon_data["K_LV"]
	owned_weapon_container.add_child(noww)
	noww.show()
	noww.texture = load(weapon_data["K_IMG"])
	noww.get_node("OwnedWeaponButton").get_material().set_shader_parameter("bg_color", WeaponSetting.weapons_level_color[weapon_lv])
	noww.get_node("WeaponPanel/WeaponDetail/OverviewBox/Panel/WeaponTexture").texture = load(weapon_data["K_IMG"])
	noww.get_node("WeaponPanel/WeaponDetail/OverviewBox/Panel")["self_modulate"] = WeaponSetting.weapons_level_color[weapon_lv]
	noww.get_node("WeaponPanel/WeaponDetail/OverviewBox/WeaponName").text = tr(weapon_data["K_WEAPON_NAME"])
	for k in Attr_list:
		if weapon_data[k] != 0:
			var new_attr_text = attr_text.duplicate()
			new_attr_text.text = tr(k) + "  " + str(weapon_data[k])
			attr_box.add_child(new_attr_text)
	nowb.mouse_entered.connect(show_detail.bind(weapon_panel))
	nowb.mouse_exited.connect(hide_detail.bind(weapon_panel))
	nowb.pressed.connect(show_op_weapon.bind(weapon_panel))
	owb_ls.append(nowb)
	var op_button = noww.get_node("WeaponPanel/WeaponDetail/OpButton")
	var nob_sell = op_button.duplicate()
	var price = weapon_data["K_PRICE"]*pow(2,weapon_lv-1)
	nob_sell.text = tr("K_SELL") + "(" + str(price) + ")"
	weapon_detail.add_child(nob_sell)
	nob_sell.show()
	nob_sell.pressed.connect(sell_weapon.bind(new_weapon_index))
	var nob_cancel = op_button.duplicate()
	nob_cancel.text = tr("K_CANCEL")
	weapon_detail.add_child(nob_cancel)
	nob_cancel.show()
	nob_cancel.pressed.connect(hide_op_weapon.bind(weapon_panel))
	var synthesis_list = []
	if weapon_lv < 4:
		for j in range(0, Playerstats.weapon_list.size()):
			if weapon_data["K_WEAPON_NAME"] ==  Playerstats.weapon_list[j]["K_WEAPON_NAME"] \
				and weapon_lv ==  Playerstats.weapon_list[j]["K_LV"]:
				synthesis_list.append(j)
	if synthesis_list.size() > 1:
		update_candidates_syn(synthesis_list)

func sell_weapon(i):
	show_buts()
	var weapon_sold = owned_weapon_container.get_child(i)
	var weapon_name = Playerstats.weapon_list[i]["K_WEAPON_NAME"]
	var weapon_lv = Playerstats.weapon_list[i]["K_LV"]
	var synthesis_list = []
	var price = Playerstats.weapon_list[i]["K_PRICE"]*pow(2,weapon_lv-1) + Playerstats.K_AFFINITY
	owb_ls.remove_at(i)
	for j in range(i+1, Playerstats.weapon_list.size()):
		var weapon_update = owned_weapon_container.get_child(j)
		var weapon_update_detail = weapon_update.get_node("WeaponPanel/WeaponDetail")
		var op_but = weapon_update_detail.get_child(-2)
		if op_but.pressed.is_connected(sell_weapon):
			op_but.pressed.disconnect(sell_weapon)
			op_but.pressed.connect(sell_weapon.bind(j-1))
		var syn_but = weapon_update_detail.get_child(-3)
		if syn_but.pressed.is_connected(synthesis_weapon):
			syn_but.pressed.disconnect(synthesis_weapon)
			syn_but.pressed.connect(synthesis_weapon.bind(j-1))
	if weapon_lv < 4:
		for idx in range(0, Playerstats.weapon_list.size()):
			if idx != i and weapon_name == Playerstats.weapon_list[idx]["K_WEAPON_NAME"] \
			and weapon_lv == Playerstats.weapon_list[idx]["K_LV"]:
				synthesis_list.append(idx)
	if synthesis_list.size() > 0:
		for x in range(0, synthesis_list.size()):
			var syn_rm_weapon = owned_weapon_container.get_child(synthesis_list[x])
			var syn_rm_but_detail = syn_rm_weapon.get_node("WeaponPanel/WeaponDetail")
			var op_but = syn_rm_but_detail.get_child(3)
			if synthesis_list.size() == 1:
				syn_rm_but_detail.remove_child(op_but)
				op_but.queue_free()
			else:
				if op_but.pressed.is_connected(synthesis_weapon):
					op_but.pressed.disconnect(synthesis_weapon)
					op_but.pressed.connect(synthesis_weapon.bind(synthesis_list[x]))
	owned_weapon_container.remove_child(weapon_sold)
	weapon_sold.queue_free()
	Playerstats.weapon_list.remove_at(i)
	Playerstats.bounty_count += price
	Controller.market.bounty_count.text = str(Playerstats.bounty_count)
	emit_signal("switch_mask_panel")

#@param: when use, always add 1
func synthesis_weapon(i):
	show_buts()
	var synthesis_list = []
	var old_weapon_data = Playerstats.weapon_list[i]
	for j in range(0, Playerstats.weapon_list.size()):
		if old_weapon_data["K_WEAPON_NAME"] ==  Playerstats.weapon_list[j]["K_WEAPON_NAME"] \
		 and old_weapon_data["K_LV"] ==  Playerstats.weapon_list[j]["K_LV"] and j != i:
			synthesis_list.append(j)
	var remove_idx = synthesis_list.pop_back()
	if i > remove_idx:
		i += remove_idx
		remove_idx = i - remove_idx
		i = i - remove_idx
	var weapon_removed = owned_weapon_container.get_child(remove_idx)
	var weapon_updated = owned_weapon_container.get_child(i)
	owb_ls.remove_at(remove_idx)
	for j in range(remove_idx+1, Playerstats.weapon_list.size()):
		var weapon_update_x = owned_weapon_container.get_child(j)
		var weapon_update_detail = weapon_update_x.get_node("WeaponPanel/WeaponDetail")
		var op_but = weapon_update_detail.get_child(-2)
		if op_but.pressed.is_connected(sell_weapon):
			op_but.pressed.disconnect(sell_weapon)
			op_but.pressed.connect(sell_weapon.bind(j-1))
		var syn_but = weapon_update_detail.get_child(-3)
		if syn_but.pressed.is_connected(synthesis_weapon):
			syn_but.pressed.disconnect(synthesis_weapon)
			syn_but.pressed.connect(synthesis_weapon.bind(j-1))
	Playerstats.update_weapon(i)
	Playerstats.remove_weapon(remove_idx)
	owned_weapon_container.remove_child(weapon_removed)
	weapon_removed.queue_free()
	var weapon_data = Playerstats.weapon_list[i]
	var weapon_lv = weapon_data["K_LV"]
	weapon_updated.get_node("WeaponPanel/WeaponDetail/OverviewBox/Panel")["self_modulate"] = WeaponSetting.weapons_level_color[weapon_lv]
	weapon_updated.get_node("WeaponPanel").hide()
	weapon_updated.get_node("OwnedWeaponButton").get_material().set_shader_parameter("bg_color", WeaponSetting.weapons_level_color[weapon_lv])
	var attr_box = weapon_updated.get_node("WeaponPanel/WeaponDetail/AttrBox")
	attr_box.get_child(1).text = tr("K_LV") + "  " + str(weapon_lv)
	attr_box.get_child(2).text = tr("K_ATK") + "  " + str(weapon_data["K_ATK"])
	var price = weapon_data["K_PRICE"]*pow(2,weapon_lv-1)
	var nob_sell = weapon_updated.get_node("WeaponPanel/WeaponDetail").get_child(-2)
	nob_sell.text = tr("K_SELL") + "(" + str(price) + ")"
	if synthesis_list.size() > 0:
		for x in range(0, synthesis_list.size()):
			var syn_rm_weapon = owned_weapon_container.get_child(synthesis_list[x])
			var syn_rm_but_detail = syn_rm_weapon.get_node("WeaponPanel/WeaponDetail")
			var op_but = syn_rm_but_detail.get_child(-3)
			if synthesis_list.size() == 1:
				syn_rm_but_detail.remove_child(op_but)
				op_but.queue_free()
			else:
				if op_but.pressed.is_connected(synthesis_weapon):
					op_but.pressed.disconnect(synthesis_weapon)
					op_but.pressed.connect(synthesis_weapon.bind(synthesis_list[x]))
	var cand_list = []
	if weapon_lv < 4:
		for j in range(0, Playerstats.weapon_list.size()):
			if weapon_data["K_WEAPON_NAME"] ==  Playerstats.weapon_list[j]["K_WEAPON_NAME"] \
				and weapon_lv ==  Playerstats.weapon_list[j]["K_LV"]:
					cand_list.append(j)
	if cand_list.size() > 1:
		update_candidates_syn(cand_list)
	else:
		var syn_rm_but_detail = weapon_updated.get_node("WeaponPanel/WeaponDetail")
		var op_but = syn_rm_but_detail.get_child(-3)
		syn_rm_but_detail.remove_child(op_but)
		op_but.queue_free()
	emit_signal("switch_mask_panel")

func update_candidates_syn(cand_list):
	for i in range(0, cand_list.size()):
		var bk_idx = cand_list[i]
		var weapon_checked = owned_weapon_container.get_child(bk_idx)
		var weapon_check_detail = weapon_checked.get_node("WeaponPanel/WeaponDetail")
		var wcdcs = weapon_check_detail.get_children()
		if wcdcs.size() == 6:
			var checked_syn_button = weapon_check_detail.get_child(-3)
			if checked_syn_button.pressed.is_connected(synthesis_weapon):
				checked_syn_button.pressed.disconnect(synthesis_weapon)
				checked_syn_button.pressed.connect(synthesis_weapon.bind(bk_idx))
		else:
			var op_but = weapon_check_detail.get_child(-3)
			var sell_but = weapon_check_detail.get_child(-2)
			var cancel_but = weapon_check_detail.get_child(-1)
			var new_syn_button = op_but.duplicate()
			new_syn_button.show()
			weapon_check_detail.remove_child(sell_but)
			weapon_check_detail.remove_child(cancel_but)
			weapon_check_detail.add_child(new_syn_button)
			weapon_check_detail.add_child(sell_but)
			weapon_check_detail.add_child(cancel_but)
			new_syn_button.pressed.connect(synthesis_weapon.bind(bk_idx))

func show_op_weapon(weapon_panel):
	hide_buts()
	weapon_panel.show()
	emit_signal("switch_mask_panel")

func hide_op_weapon(weapon_panel):
	show_buts()
	weapon_panel.hide()
	emit_signal("switch_mask_panel")

func hide_buts():
	for i in owb_ls:
		i.hide()

func show_buts():
	for i in owb_ls:
		i.show()

func show_detail(attr_detail):
	attr_detail.show()

func hide_detail(attr_detail):
	attr_detail.hide()
