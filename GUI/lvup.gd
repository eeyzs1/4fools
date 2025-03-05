extends CanvasLayer

@onready var items_grid: GridContainer = $ItemsGrid
@onready var item_panel: Panel = $ItemsGrid/ItemPanel
@onready var attr_panel: Panel = $AttrPanel
@onready var refresh_button: Button = $RefreshButton
@onready var background = $Background
@onready var bounty_count = $BountyBox/BountyCount
@onready var upgrade_label = $UpgradeLabel

#13
const Attr_Dict = {
	"K_MAX_HP":{
		"text":"K_MAX_HP_DESC",
		"img":"res://asset/attr/hp.png",
		"min":1,
		"max":10
	},
	"K_HP_RECOVERY_RATE":{
		"text":"K_HP_RECOVERY_RATE_DESC",
		"img":"res://asset/attr/hp_recovery.png",
		"min":1,
		"max":5
	},
	"K_EVASION":{
		"text":"K_EVASION_DESC",
		"img":"res://asset/attr/evasion.png",
		"min":1,
		"max":10
	},
	"K_ACCURACY":{
		"text":"K_ACCURACY_DESC",
		"img":"res://asset/attr/accuracy.png",
		"min":1,
		"max":5
	},
	"K_CRIT_RATE":{
		"text":"K_CRIT_RATE_DESC",
		"img":"res://asset/attr/crit.png",
		"min":1,
		"max":5
	},
	"K_BOUNTY_GAIN":{
		"text":"K_BOUNTY_GAIN_DESC",
		"img":"res://asset/attr/bounty_gain.png",
		"min":1,
		"max":2
	},
	"K_EXP_GAIN":{
		"text":"K_EXP_GAIN_DESC",
		"img":"res://asset/attr/exp_gain.png",
		"min":1,
		"max":2
	},
	"K_ELOQUENCY":{#口才
		"text":"K_ELOQUENCY_DESC",
		"img":"res://asset/attr/eloquency.png",
		"min":1,
		"max":3
	},
	"K_AFFINITY":{#亲和力
		"text":"K_AFFINITY_DESC",
		"img":"res://asset/attr/affinity.png",
		"min":1,
		"max":5
	},
	"K_SANITY":{#理智
		"text":"K_SANITY_DESC",
		"img":"res://asset/attr/sanity.png",
		"min":1,
		"max":5
	},
	"K_INTELLIGENCE":{
		"text":"K_INTELLIGENCE_DESC",
		"img":"res://asset/attr/intelligence.png",
		"min":1,
		"max":5
	},
	"K_EFFICIENCY":{
		"text":"K_EFFICIENCY_DESC",
		"img":"res://asset/attr/efficiency.png",
		"min":-8,
		"max":8
	}
}

var keys = Attr_Dict.keys()
var dict_length = keys.size() - 1
var refresh_cost = 2


func init():
	Controller.play_music("res://asset/music/stage/ATaleForTheJourney.ogg")
	refresh_cost = 2
	gen_items()
	attr_panel.load_Playerstats_attr()
	#background.texture = load(NpcSettings.battle_field_maps.pick_random())

func gen_items():
	update_bounty_count()
	upgrade_label.text = tr("K_UPGRADE") + ": " + str(Playerstats.K_UPGRADE_COUNT)
	var item_panels_list = items_grid.get_children()
	for i in range(1, len(item_panels_list)):
		items_grid.remove_child(item_panels_list[i])
		item_panels_list[i].queue_free()
	for i in range(8):
		var new_item_panel = item_panel.duplicate()
		items_grid.add_child(new_item_panel)
		var item_name: Label = new_item_panel.get_node("MarginContainer/HBoxContainer/ItemDescrip/ItemName")
		var item_text: Label = new_item_panel.get_node("MarginContainer/HBoxContainer/ItemDescrip/ItemText")
		var item_attr_text: RichTextLabel = new_item_panel.get_node("ItemAttrText")
		var item_button: Button = new_item_panel.get_node("ItemButton")
		var item_texture = new_item_panel.get_node("MarginContainer/HBoxContainer/Panel/ItemTextureRect")
		if refresh_cost > Playerstats.bounty_count:
			refresh_button["theme_override_colors/font_color"] = Color.RED
			refresh_button["theme_override_colors/font_focus_color"] = Color.RED
			refresh_button.text = tr("K_REFRESH")+" -"+str(refresh_cost)
		else:
			refresh_button["theme_override_colors/font_color"] = Color.GREEN
			refresh_button["theme_override_colors/font_focus_color"] = Color.GREEN
			refresh_button.text = tr("K_REFRESH")+" -"+str(refresh_cost)
		var attr_index = randi_range(0, dict_length)
		var attr_key = keys[attr_index]
		var attr_text = Attr_Dict[attr_key].text
		var attr_img = Attr_Dict[attr_key].img
		var attr_val = randi_range(Attr_Dict[attr_key].min,Attr_Dict[attr_key].max)
		item_name.text = attr_key
		item_text.text = attr_text
		item_texture.texture = load(attr_img)
		if attr_val > 0:
			item_attr_text.text = "[color=green]+"+str(attr_val)+"[/color] "+tr(attr_key)
		else:
			item_attr_text.text = "[color=red]"+str(attr_val)+"[/color] "+ tr(attr_key)
		#item_texture_rect = 
		item_button.pressed.connect(choose_item.bind(
			{"key":attr_key,
			"val":attr_val}
		))
		new_item_panel.show()

func choose_item(attr_info):
	Playerstats[attr_info.key] += attr_info.val
	var item_panels_list = items_grid.get_children()
	for i in range(1, len(item_panels_list)):
		var item_button = item_panels_list[i].get_node("ItemButton")
		if item_button.pressed.is_connected(choose_item):
			item_button.pressed.disconnect(choose_item)
	Playerstats.K_UPGRADE_COUNT -= 1
	if Playerstats.K_UPGRADE_COUNT == 0:
		hide()
		Controller.show_market()
	else:
		gen_items()
		attr_panel.load_Playerstats_attr()

func _on_refresh_button_pressed() -> void:
	if refresh_cost <= Playerstats.bounty_count:
		Playerstats.bounty_count -= refresh_cost
		refresh_cost += 2
		var item_panels_list = items_grid.get_children()
		for i in range(1, len(item_panels_list)):
			var item_button = item_panels_list[i].get_node("ItemButton")
			if item_button.pressed.is_connected(choose_item):
				item_button.pressed.disconnect(choose_item)
		gen_items()

func update_bounty_count():
	bounty_count.text = str(Playerstats.bounty_count)
