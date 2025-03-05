extends CanvasLayer

@onready var background: TextureRect = $Background
@onready var bounty_count: Label = $BountyBox/BountyCount
@onready var salesperson: TextureRect = $Salesperson
@onready var items_grid: GridContainer = $ItemsGrid
@onready var item_panel: Panel = $ItemsGrid/ItemPanel
@onready var owned_item_panel = $OwnedItemPanel
@onready var owned_weapon_scroll_container = $OwnedWeaponScrollContainer
@onready var patience_bar: ProgressBar = $Salesperson/PatienceBar
@onready var refresh_button: Button = $RefreshButton
@onready var attr_panel: Panel = $AttrPanel
@onready var patience_label = $Salesperson/PatienceBar/PatienceLabel
@onready var mask_panel = $MaskPanel
@onready var mask_panel_2 = $MaskPanel2

var refresh_cost = 2
var item_list = []
var patience :int:
	set(v):
		patience = v
		patience_bar.value = v
		patience_label.text = str(v)

func init(market_dict):
	refresh_cost = 2
	bounty_count.text = str(Playerstats.bounty_count)
	background.texture = load(market_dict["bg_image"])
	Controller.play_music(market_dict["bg_music"])
	salesperson.texture = load(market_dict["salesperson"])
	patience = market_dict["patience"]
	item_list = market_dict["item_list"]
	gen_items()
	owned_item_panel.show_owned_items()
	owned_weapon_scroll_container.show_owned_weapons(true)
	attr_panel.load_Playerstats_attr()

func gen_items():
	if refresh_cost > Playerstats.bounty_count:
		refresh_button["theme_override_colors/font_color"] = Color.RED
		refresh_button["theme_override_colors/font_focus_color"] = Color.RED
		refresh_button.text = tr("K_REFRESH")+" -"+str(refresh_cost)
	else:
		refresh_button["theme_override_colors/font_color"] = Color.GREEN
		refresh_button["theme_override_colors/font_focus_color"] = Color.GREEN
		refresh_button.text = tr("K_REFRESH")+" -"+str(refresh_cost)
	
	var igc = items_grid.get_children()
	for i in range(1, len(igc)):
		items_grid.remove_child(igc[i])
		igc[i].queue_free()

	for i in range(9):
		var item = item_list.pick_random()
		var item_name = item[0]
		var item_price = item[1]
		var chose_item
		var weapon_lv = 0
		var price
		var nip = item_panel.duplicate()
		nip.show()
		items_grid.add_child(nip)
		if Setting.Items.has(item_name):
			chose_item = Setting.Items[item_name]
			price = max(1, item_price - Playerstats.K_ELOQUENCY)
		else:
			chose_item = WeaponSetting.weapons_data[item_name]
			weapon_lv = WeaponSetting.weapons_level_color.keys().pick_random()
			price = max(1, item_price * pow(2, weapon_lv-1)  - Playerstats.K_ELOQUENCY)
			nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel")["self_modulate"] = Color(WeaponSetting.weapons_level_color[weapon_lv])
		nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel/ItemImg").texture = load(chose_item["K_IMG"])
		nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/ItemName").text = tr(item_name)
		var gain_container = nip.get_node("MarginContainer/HBoxContainer/GainScrollContainer/GainVBoxContainer")
		var gain_label = gain_container.get_node("GainLabel")
		for j in chose_item:
			if typeof(chose_item[j]) != TYPE_STRING:
				if j == "K_ATK":
					var ngl = gain_label.duplicate()
					ngl.text = "[color=green]+"+str(chose_item[j]*pow(2, weapon_lv-1) + weapon_lv*chose_item["K_GROWTH"])+"[/color] "+tr(j)
					gain_container.add_child(ngl)
				elif chose_item[j] > 0:
					var ngl = gain_label.duplicate()
					ngl.text = "[color=green]+"+str(chose_item[j])+"[/color] "+tr(j)
					gain_container.add_child(ngl)
				elif chose_item[j] < 0:
					var nll = gain_label.duplicate()
					nll.text = "[color=red]"+str(chose_item[j])+"[/color] "+tr(j)
					gain_container.add_child(nll)
		var item_button = nip.get_node("ItemButton")
		item_button.get_node("HBoxContainer/Label").text = tr("K_BUY") + "  -" + str(price)
		item_button.pressed.connect(buy_item.bind(item_name, i, price, weapon_lv))

func regen_items():
	var igc = items_grid.get_children()
	for i in range(1,10):
		var item = item_list.pick_random()
		var item_name = item[0]
		var item_price = item[1]
		var chose_item
		var weapon_lv = 0
		var price
		var nip = igc[i]
		if Setting.Items.has(item_name):
			nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel")["self_modulate"] = Color.WHITE
			chose_item = Setting.Items[item_name]
			price = max(1, item_price - Playerstats.K_ELOQUENCY)
		else:
			chose_item = WeaponSetting.weapons_data[item_name]
			weapon_lv = WeaponSetting.weapons_level_color.keys().pick_random()
			price = max(1, item_price * pow(2, weapon_lv-1)  - Playerstats.K_ELOQUENCY)
			nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel")["self_modulate"] = WeaponSetting.weapons_level_color[weapon_lv]
		nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel/ItemImg").texture = load(chose_item["K_IMG"])
		nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/ItemName").text = tr(item_name)
		var gain_container = nip.get_node("MarginContainer/HBoxContainer/GainScrollContainer/GainVBoxContainer")
		var gcls = gain_container.get_children()
		for j in range(1, len(gcls)):
			gain_container.remove_child(gcls[j])
			gcls[j].queue_free()
		var gain_label = gain_container.get_node("GainLabel")
		for j in chose_item:
			if typeof(chose_item[j]) != TYPE_STRING:
				if j == "K_ATK":
					var ngl = gain_label.duplicate()
					ngl.text = "[color=green]+"+str(chose_item[j]*pow(2, weapon_lv-1)+ weapon_lv*chose_item["K_GROWTH"])+"[/color] "+tr(j)
					gain_container.add_child(ngl)
				elif chose_item[j] > 0:
					var ngl = gain_label.duplicate()
					ngl.text = "[color=green]+"+str(chose_item[j])+"[/color] "+tr(j)
					gain_container.add_child(ngl)
				elif chose_item[j] < 0:
					var nll = gain_label.duplicate()
					nll.text = "[color=red]"+str(chose_item[j])+"[/color] "+tr(j)
					gain_container.add_child(nll)
		var item_button = nip.get_node("ItemButton")
		item_button.get_node("HBoxContainer/Label").text = tr("K_BUY") + "  -" + str(price)
		if item_button.pressed.is_connected(buy_item):
			item_button.pressed.disconnect(buy_item)
		item_button.pressed.connect(buy_item.bind(item_name, i - 1, price, weapon_lv))

func regenerate_item(idx):
	var nip = items_grid.get_child(idx+1)
	var item = item_list.pick_random()
	var item_name = item[0]
	var item_price = item[1]
	var chose_item
	var price
	var weapon_lv = 0
	if Setting.Items.has(item_name):
		chose_item = Setting.Items[item_name]
		price = max(1, item_price - Playerstats.K_ELOQUENCY)
		nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel")["self_modulate"] = Color.WHITE
	else:
		chose_item = WeaponSetting.weapons_data[item_name]
		weapon_lv = WeaponSetting.weapons_level_color.keys().pick_random()
		price = max(1, item_price * weapon_lv  - Playerstats.K_ELOQUENCY)
		nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel")["self_modulate"] = WeaponSetting.weapons_level_color[weapon_lv]
	nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/Panel/ItemImg").texture = load(chose_item["K_IMG"])
	nip.get_node("MarginContainer/HBoxContainer/VBoxContainer/ItemName").text = tr(item_name)
	var gain_container = nip.get_node("MarginContainer/HBoxContainer/GainScrollContainer/GainVBoxContainer")
	var gain_label = gain_container.get_node("GainLabel")
	var gcls = gain_container.get_children()
	for i in range(1, len(gcls)):
		gain_container.remove_child(gcls[i])
		gcls[i].queue_free()
	for j in chose_item:
		if typeof(chose_item[j]) != TYPE_STRING:
			if j == "K_ATK":
				var ngl = gain_label.duplicate()
				ngl.text = "[color=green]+"+str(chose_item[j]*pow(2, weapon_lv-1) + weapon_lv*chose_item["K_GROWTH"])+"[/color] "+tr(j)
				gain_container.add_child(ngl)
			elif chose_item[j] > 0:
				var ngl = gain_label.duplicate()
				ngl.text = "[color=green]+"+str(chose_item[j])+"[/color] "+tr(j)
				gain_container.add_child(ngl)
			elif chose_item[j] < 0:
				var nll = gain_label.duplicate()
				nll.text = "[color=red]"+str(chose_item[j])+"[/color] "+tr(j)
				gain_container.add_child(nll)
	var item_button = nip.get_node("ItemButton")
	item_button.get_node("HBoxContainer/Label").text = tr("K_BUY") + "  -" + str(price)
	if item_button.pressed.is_connected(buy_item):
		item_button.pressed.disconnect(buy_item)
	item_button.pressed.connect(buy_item.bind(item_name, idx, price, weapon_lv))

func buy_item(item_name, i, price, weapon_lv):
	if price <= Playerstats.bounty_count:
		if weapon_lv == 0:#weapon lv start from 1,so this is item
			Playerstats.bounty_count -= price
			update_refresh_cost()
			Playerstats.add_item(item_name, 1.0)
			bounty_count.text = str(Playerstats.bounty_count)
			attr_panel.update_Playerstats_attr()
			var item_index = Playerstats.itemDict.keys().find(item_name)
			var item_num = Playerstats.itemDict[item_name]
			if item_num > 1:
				owned_item_panel.update_item_count(item_index,item_num)
			else:
				owned_item_panel.add_item(item_name, item_num)
			regenerate_item(i)
		else:
			Playerstats.bounty_count -= price
			bounty_count.text = str(Playerstats.bounty_count)
			var weapon_data = {"K_WEAPON_NAME": item_name, "K_LV": weapon_lv}
			weapon_data.merge(WeaponSetting.weapons_data[item_name].duplicate())
			owned_weapon_scroll_container.buy_weapon(weapon_data)
			regenerate_item(i)

func show_detail(attr_detail):
	attr_detail.show()

func hide_detail(attr_detail):
	attr_detail.hide()

func _on_continue_button_pressed() -> void:
	Controller.market_end()

func _on_refresh_button_pressed() -> void:
	if refresh_cost <= Playerstats.bounty_count:
		bounty_count.text = str(Playerstats.bounty_count)
		if refresh_cost > Playerstats.K_AFFINITY:
			Playerstats.bounty_count -= (refresh_cost - Playerstats.K_AFFINITY)
			patience -= max(0,(refresh_cost - Playerstats.K_AFFINITY))
		else:
			patience -= min(refresh_cost, Playerstats.K_AFFINITY)
		if patience <= 0:
			Controller.market_end()
		else:
			refresh_cost += 2
			update_refresh_cost()
			regen_items()

func update_refresh_cost():
	if refresh_cost > Playerstats.bounty_count:
		refresh_button["theme_override_colors/font_color"] = Color.RED
		refresh_button["theme_override_colors/font_focus_color"] = Color.RED
		refresh_button.text = tr("K_REFRESH")+" -"+str(refresh_cost)
	else:
		refresh_button["theme_override_colors/font_color"] = Color.GREEN
		refresh_button["theme_override_colors/font_focus_color"] = Color.GREEN
		refresh_button.text = tr("K_REFRESH")+" -"+str(refresh_cost)

func _on_owned_weapon_scroll_container_switch_mask_panel():
	if mask_panel.visible:
		mask_panel.hide()
		mask_panel_2.hide()
		salesperson["mouse_filter"] = Control.MOUSE_FILTER_STOP
		patience_bar["mouse_filter"] = Control.MOUSE_FILTER_STOP
	else:
		mask_panel.show()
		mask_panel_2.show()
		salesperson["mouse_filter"] = Control.MOUSE_FILTER_IGNORE
		patience_bar["mouse_filter"] = Control.MOUSE_FILTER_IGNORE
