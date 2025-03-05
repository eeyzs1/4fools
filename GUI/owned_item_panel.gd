extends Panel

@onready var owned_item_container: GridContainer = $ScrollContainer/OwnedItemContainer
@onready var scroll_container = $ScrollContainer

const owned_item_window = preload("res://GUI/owned_item_window.tscn")

var oiw_inst_length

func _ready():
	var v_scroll_bar = scroll_container.get_v_scroll_bar()
	v_scroll_bar.scrolling.connect(scrolling_items)
	var inst = owned_item_window.instantiate()
	inst.show()
	owned_item_container.add_child(inst)
	oiw_inst_length = inst.size.y
	inst.queue_free()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			scrolling_items()

func show_owned_items():
	var oics = owned_item_container.get_children()
	for i in range(0, len(oics)):
		owned_item_container.remove_child(oics[i])
		oics[i].queue_free()
	for i in Playerstats.itemDict:
		var item_num = Playerstats.itemDict[i]
		var owned_item = Setting.Items[i]
		var oiw = owned_item_window.instantiate()
		oiw.show()
		owned_item_container.add_child(oiw)
		oiw.texture = load(owned_item["K_IMG"])
		oiw.get_node("Num").text = "x" + str(item_num)
		oiw.get_node("ItemDetailPanel/ItemDetail/OverviewBox/ItemTexture").texture = load(owned_item["K_IMG"])
		oiw.get_node("ItemDetailPanel/ItemDetail/OverviewBox/ItemName").text = i
		var attr_detail = oiw.get_node("ItemDetailPanel")
		oiw.mouse_entered.connect(show_detail.bind(attr_detail))
		oiw.mouse_exited.connect(hide_detail.bind(attr_detail))
		var attr_box = oiw.get_node("ItemDetailPanel/ItemDetail/AttrBox")
		var item_attr_text = oiw.get_node("ItemDetailPanel/ItemDetail/AttrBox/ItemAttrText")
		for j in owned_item:
			if typeof(owned_item[j]) != TYPE_STRING:
				var iat = item_attr_text.duplicate()
				attr_box.add_child(iat)
				if owned_item[j] > 0:
					iat.text = "[color=green]+"+str(owned_item[j])+"[/color] "+tr(j)
				elif owned_item[j] < 0:
					iat.text = "[color=red]"+str(owned_item[j])+"[/color] "+tr(j)
	scrolling_items()

func update_item_count(index, item_num):
	owned_item_container.get_child(index).get_node("Num").text = "x" + str(item_num)

func add_item(item_name, item_num):
	var owned_item = Setting.Items[item_name]
	var oiw = owned_item_window.instantiate()
	oiw.show()
	owned_item_container.add_child(oiw)
	oiw.texture = load(owned_item["K_IMG"])
	oiw.get_node("Num").text = "x" + str(item_num)
	oiw.get_node("ItemDetailPanel/ItemDetail/OverviewBox/ItemTexture").texture = load(owned_item["K_IMG"])
	oiw.get_node("ItemDetailPanel/ItemDetail/OverviewBox/ItemName").text = item_name
	var item_detail_panel = oiw.get_node("ItemDetailPanel")
	oiw.mouse_entered.connect(show_detail.bind(item_detail_panel))
	oiw.mouse_exited.connect(hide_detail.bind(item_detail_panel))
	var attr_box = oiw.get_node("ItemDetailPanel/ItemDetail/AttrBox")
	var item_attr_text = oiw.get_node("ItemDetailPanel/ItemDetail/AttrBox/ItemAttrText")
	for j in owned_item:
		if typeof(owned_item[j]) != TYPE_STRING:
			var iat = item_attr_text.duplicate()
			attr_box.add_child(iat)
			if owned_item[j] > 0:
				iat.text = "[color=green]+"+str(owned_item[j])+"[/color] "+tr(j)
			else:
				iat.text = "[color=red]"+str(owned_item[j])+"[/color] "+tr(j)

func show_detail(attr_detail):
	attr_detail.show()

func hide_detail(attr_detail):
	attr_detail.hide()

func scrolling_items():
	var scrolled_length = scroll_container.scroll_vertical
	var item_length = oiw_inst_length
	var grid_columns = owned_item_container["columns"]
	var v_seperation = owned_item_container["theme_override_constants/v_separation"]
	var transparent_rows = int(scrolled_length)/((int)(item_length + v_seperation))
	var min_uv = float(scrolled_length%((int)(item_length + v_seperation)))/float(item_length)
	var last_full_transparent_index = grid_columns*transparent_rows
	var last_part_transparent_index = last_full_transparent_index + grid_columns
	var oiws = owned_item_container.get_children()
	for i in range(0, len(oiws)):
		if i < last_full_transparent_index:
			oiws[i].get_material().set_shader_parameter("min_uv", Vector2(1.0, 1.0))
		elif i < last_part_transparent_index:
			oiws[i].get_material().set_shader_parameter("min_uv", Vector2(0.0, min_uv))
		else:
			oiws[i].get_material().set_shader_parameter("min_uv", Vector2(0.0, 0.0))
