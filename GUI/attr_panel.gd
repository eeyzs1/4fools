extends Panel

@onready var attr_list: VBoxContainer = $AttrList
@onready var attr_template: HBoxContainer = $AttrList/AttrTemplate


func load_Playerstats_attr():
	var attrs_list = attr_list.get_children()
	for i in range(1, len(attrs_list)):
		attr_list.remove_child(attrs_list[i])
		attrs_list[i].queue_free()
	for i in Playerstats.Player_Attr_Dict.keys():
		var new_attr_tpl = attr_template.duplicate()
		attr_list.add_child(new_attr_tpl)
		var new_attr_panel = new_attr_tpl.get_node("AttrImg/Panel")
		var Img = load(Playerstats.Player_Attr_Dict[i]["img"])
		new_attr_tpl.get_node("AttrImg").texture = Img
		new_attr_tpl.get_node("AttrName").text = i
		new_attr_tpl.get_node("AttrValue").text = str(Playerstats[i])
		new_attr_panel.get_node("Img").texture = Img
		new_attr_panel.get_node("Name").text = i
		new_attr_panel.get_node("Desc").text = tr(Playerstats.Player_Attr_Dict[i]["text"])
		new_attr_tpl.mouse_entered.connect((func(x): x.show()).bind(new_attr_panel))
		new_attr_tpl.mouse_exited.connect((func(x): x.hide()).bind(new_attr_panel))
		new_attr_tpl.show()

func update_Playerstats_attr():
	var attrs_list = attr_list.get_children()
	var keys = Playerstats.Player_Attr_Dict.keys()
	for i in range(0, keys.size()):
		var new_attr_tpl = attrs_list[i+1]
		new_attr_tpl.get_node("AttrValue").text = str(Playerstats[keys[i]])
