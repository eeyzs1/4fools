extends CanvasLayer

const FIXED_ATTRS = ["K_MAX_HP","K_MAX_EXP","K_LV","K_ARMOR","K_ADD_DMG","K_EXPL_RNG","K_EXPL_DMG","K_TP","K_RICO","K_SPL","K_BOUNTY_GAIN","K_EXP_GAIN"]

const MUTABLE_ATTRS = ["K_HP_RECOVERY_RATE","K_INFO","K_SPEED","K_EFFICIENCY","K_EVASION","K_ACCURACY","K_CRIT_RATE","K_ELOQUENCY","K_AFFINITY","K_SANITY","K_INTELLIGENCE"]

@onready var background = $Background

@onready var role_panel_container = $HSplitContainer/SelectRolePanel/ScrollContainer/RolePanelContainer
@onready var chose_role_button = $HSplitContainer/SelectRolePanel/ScrollContainer/RolePanelContainer/ChoseRoleButton

@onready var owned_weapon_container = $HSplitContainer/AttrPanel/OwnedWeaponPanel/OwnedWeaponScrollContainer/OwnedWeaponContainer
@onready var owned_weapon_window = $HSplitContainer/AttrPanel/OwnedWeaponPanel/OwnedWeaponScrollContainer/OwnedWeaponContainer/OwnedWeaponWindow

@onready var role_pic = $HSplitContainer/AttrPanel/RolePic
@onready var role_name = $HSplitContainer/AttrPanel/RolePic/HBoxContainer/RoleName
@onready var attr_pts_label = $HSplitContainer/AttrPanel/RolePic/HBoxContainer/AttrPtsLabel
@onready var attr_points = $HSplitContainer/AttrPanel/RolePic/HBoxContainer/AttrPoints
@onready var init_bounty = $HSplitContainer/AttrPanel/RolePic/HBoxContainer/InitBounty
@onready var desc = $HSplitContainer/AttrPanel/RolePic/Desc

@onready var fixed_attrs_list = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/FixedAttrsList
@onready var fixed_attr_template = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/FixedAttrsList/AttrTemplate

@onready var attr_name_list = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrNameList
@onready var attr_template = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrNameList/AttrTemplate

@onready var attr_dec_list = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrDecList
@onready var attr_dec_btn = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrDecList/attr_dec_btn
@onready var attr_val_list = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrValList
@onready var attr_val_label = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrValList/AttrValLabel
@onready var attr_inc_list = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrIncList
@onready var attr_inc_btn = $HSplitContainer/AttrPanel/RoleCusPanel/ScrollContainer/PanelContainer/AttrIncList/attr_inc_btn

var role_chose = null
var not_inited = true

func init():
	role_chose = null
	background.texture = load(NpcSettings.battle_field_maps.pick_random())
	if not_inited:
		not_inited = false
		for i in Playerstats.ROLE_TEMPLATE:
			var new_crb = chose_role_button.duplicate()
			new_crb.get_node("RoleAvatar").texture = load(Playerstats.ROLE_TEMPLATE[i]["avatar"])
			new_crb.pressed.connect(update_attr_panels_when_role_chose.bind(i))
			role_panel_container.add_child(new_crb)
			new_crb.show()

		for i in FIXED_ATTRS:
			var new_fixed_attr_tpl = fixed_attr_template.duplicate()
			fixed_attrs_list.add_child(new_fixed_attr_tpl)
			var new_attr_panel = new_fixed_attr_tpl.get_node("AttrImg/Panel")
			var Img = load(Playerstats.Player_Attr_Dict[i]["img"])
			new_fixed_attr_tpl.get_node("AttrImg").texture = Img
			new_fixed_attr_tpl.get_node("AttrName").text = i
			new_attr_panel.get_node("Img").texture = Img
			new_attr_panel.get_node("Name").text = i
			new_attr_panel.get_node("Desc").text = tr(Playerstats.Player_Attr_Dict[i]["text"])
			new_fixed_attr_tpl.mouse_entered.connect((func(x): x.show()).bind(new_attr_panel))
			new_fixed_attr_tpl.mouse_exited.connect((func(x): x.hide()).bind(new_attr_panel))
			new_fixed_attr_tpl.show()

		var j = 1
		for i in MUTABLE_ATTRS:
			var new_attr_tpl = attr_template.duplicate()
			attr_name_list.add_child(new_attr_tpl)
			var new_attr_panel = new_attr_tpl.get_node("AttrImg/Panel")
			var Img = load(Playerstats.Player_Attr_Dict[i]["img"])
			new_attr_tpl.get_node("AttrImg").texture = Img
			new_attr_tpl.get_node("AttrName").text = i
			new_attr_panel.get_node("Img").texture = Img
			new_attr_panel.get_node("Name").text = i
			new_attr_panel.get_node("Desc").text = str(Playerstats.Player_Attr_Dict[i]["text"])
			new_attr_tpl.mouse_entered.connect((func(x): x.show()).bind(new_attr_panel))
			new_attr_tpl.mouse_exited.connect((func(x): x.hide()).bind(new_attr_panel))
			new_attr_tpl.show()

			var new_attr_val = attr_val_label.duplicate()
			new_attr_val.show()
			attr_val_list.add_child(new_attr_val)

			var tmp_attr_dec_btn = attr_dec_btn.duplicate()
			attr_dec_list.add_child(tmp_attr_dec_btn)
			tmp_attr_dec_btn.pressed.connect(dec_attr.bind(i, j))
			tmp_attr_dec_btn.show()
			
			var tmp_attr_inc_btn = attr_inc_btn.duplicate()
			attr_inc_list.add_child(tmp_attr_inc_btn)
			tmp_attr_inc_btn.pressed.connect(inc_attr.bind(i, j))
			tmp_attr_inc_btn.show()
			j += 1
	else:
		cleanup_previous_chose_val()

func update_attr_panels_when_role_chose(role_key:String):
	role_chose = Playerstats.ROLE_TEMPLATE[role_key].duplicate()
	role_pic.texture = load(role_chose["avatar"])
	role_name.text = tr(role_key)
	attr_points.text = str(role_chose["attr_points"])
	init_bounty.text = str(role_chose["bounty_count"])
	desc.text = tr(role_chose["desc"])
	var fixed_attrs = fixed_attrs_list.get_children()
	for i in range(0, FIXED_ATTRS.size()):
		fixed_attrs[i+1].get_node("AttrValue").text = str(role_chose[FIXED_ATTRS[i]])
	
	var attr_vals = attr_val_list.get_children()
	for j in range(0, MUTABLE_ATTRS.size()):
		attr_vals[j+1].text = str(role_chose[MUTABLE_ATTRS[j]])

func cleanup_previous_chose_val():
	role_chose = null
	role_pic.texture = null
	role_name.text = ""
	attr_points.text = ""
	init_bounty.text = ""
	desc.text = ""
	var fixed_attrs = fixed_attrs_list.get_children()
	for i in range(1, FIXED_ATTRS.size() + 1):
		fixed_attrs[i].get_node("AttrValue").text = "0"
	
	var attr_vals = attr_val_list.get_children()
	for j in range(1, MUTABLE_ATTRS.size()+1):
		attr_vals[j].text = ""

##idx is the index of MUTABLE_ATTRS, +1 for find obj in scene
func inc_attr(key, idx):
	if role_chose && role_chose["attr_points"] > 0:
		role_chose["attr_points"] -= 1
		attr_points.text = str(role_chose["attr_points"])
		role_chose[key] += 1
		attr_val_list.get_child(idx).text = str(role_chose[key])

func dec_attr(key, idx):
	if role_chose && role_chose[key] > Playerstats.ROLE_TEMPLATE[role_chose["role_name"]][key]:
		role_chose["attr_points"] += 1
		attr_points.text = str(role_chose["attr_points"])
		role_chose[key] -= 1
		attr_val_list.get_child(idx).text = str(role_chose[key])

func _on_go_button_pressed():
	if role_chose != null:
		hide()
		Playerstats.init_player(role_chose)
		Controller.launch_level()

func _on_back_to_main_pressed() -> void:
	hide()
	Controller.back_to_main()
