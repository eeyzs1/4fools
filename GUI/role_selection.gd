extends CanvasLayer

@onready var ic_intro = $GridContainer/ImperialCommandoPanel/IcIntro
@onready var ad_intro = $GridContainer/AllianceDiplomatPanel/AdIntro
@onready var ne_intro = $GridContainer/NeutralExplorerPanel/NeIntro
@onready var as_intro = $GridContainer/AlienSurvivorPanel/AsIntro

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_imperial_commando_pressed() -> void:
	hide()
	Playerstats.init_player(Playerstats.ROLE_TEMPLATE["N_IC"].duplicate())
	Controller.start_game()

func _on_alliance_diplomat_pressed() -> void:
	hide()
	Playerstats.init_player(Playerstats.ROLE_TEMPLATE["N_AD"].duplicate())
	Controller.start_game()

func _on_neutral_explorer_pressed() -> void:
	hide()
	Playerstats.init_player(Playerstats.ROLE_TEMPLATE["N_NE"].duplicate())
	Controller.start_game()

func _on_alien_survivor_pressed() -> void:
	hide()
	Playerstats.init_player(Playerstats.ROLE_TEMPLATE["N_AS"].duplicate())
	Controller.start_game()

func _on_intro_mouse_entered():
	ic_intro["theme_override_colors/font_color"] = Color(1,1,1,1)

func _on_ic_intro_mouse_exited():
	ic_intro["theme_override_colors/font_color"] = Color(0,0,0,0)

func _on_ad_intro_mouse_entered():
	ad_intro["theme_override_colors/font_color"] = Color(0,0,0,1)

func _on_ad_intro_mouse_exited():
	ad_intro["theme_override_colors/font_color"] = Color(0,0,0,0)


func _on_ne_intro_mouse_entered():
	ne_intro["theme_override_colors/font_color"] = Color(1,10,0,1)


func _on_ne_intro_mouse_exited():
	ne_intro["theme_override_colors/font_color"] = Color(0,0,0,0)


func _on_as_intro_mouse_entered():
	as_intro["theme_override_colors/font_color"] = Color(1,0,0,1)


func _on_as_intro_mouse_exited():
	as_intro["theme_override_colors/font_color"] = Color(0,0,0,0)
