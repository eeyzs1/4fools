class_name Player
extends CharacterBody2D

@onready var space_ship: AnimatedSprite2D = $SpaceShip
@onready var hurt_audio = $HurtAudioStreamPlayer
@onready var pu_audio = $PuAudioStreamPlayer
@onready var move_audio = $MoveAudioStreamPlayer
@onready var timer =  $OneSecondTimer
@onready var weapons_rack = $WeaponsRack
@onready var cd_timer = $CdTimer
@onready var sp_timer = $SpTimer
@onready var sp_bar_timer = $SpBarTimer

const FLOAT_TEXT = preload("res://float_text.tscn")

var SP_FUNC_MAP = {
	"bullet_speed_slow" : self.bullet_speed_slow,
	"bullet_speed_norlmal": self.bullet_speed_norlmal,
	"become_inviolable":self.become_inviolable,
	"become_violable":self.become_violable,
	"rapid_recover":self.rapid_recover,
	"normal_recover":self.do_nothing,
	"divine_revelation":self.divine_revelation,
	"mental_injuries":self.mental_injuries,
	"cornucopia":self.cornucopia,

}  

var sp_ready = false
var sp_auto = false
var violable = true
var glow_power = 21
var glow_speed = 1
func _ready():
	hide()
	set_motion_mode(MOTION_MODE_FLOATING)

func update_canmera_limit():
	$Camera2D.limit_bottom = Controller.window_size.y
	$Camera2D.limit_right = Controller.window_size.x

func start():
	init_weapons()
	Playerstats.K_HP = Playerstats.K_MAX_HP
	$Camera2D.limit_top = 0
	$Camera2D.limit_left = 0
	$Camera2D.limit_bottom = Controller.window_size.y
	$Camera2D.limit_right = Controller.window_size.x
	timer.start()
	if Playerstats.sp_dict != null:
		Controller.hud.sp_bar.max_value = Playerstats.sp_dict["sp_cd"]
		cd_timer.set_wait_time(Playerstats.sp_dict["sp_cd"])
		sp_timer.set_wait_time(Playerstats.sp_dict["sp_period"])
		sp_auto = Playerstats.sp_dict["sp_auto"]
		prepare_sp()
	match Playerstats.role_name:
		"N_IC":
			space_ship.animation = "IC"
			space_ship.get_material().set_shader_parameter("glow_color", Color(0.02,0.01,0.01,0.05))
		"N_AD":
			space_ship.animation = "AD"
			space_ship.get_material().set_shader_parameter("glow_color", Color(0.01,0.01,0.02,0.05))
		"N_NE":
			space_ship.animation = "NE"
			space_ship.get_material().set_shader_parameter("glow_color", Color(0.015,0.01,0.015,0.05))
		"N_AS":
			space_ship.animation = "AS"
			space_ship.get_material().set_shader_parameter("glow_color", Color(0.01,0.01,0.01,0.1))
		_ :
			space_ship.animation = "IC"
			space_ship.get_material().set_shader_parameter("glow_color", Color(0.02,0.01,0.01,0.05))
	show()
	Controller.load_audio(hurt_audio, Playerstats.hurt_audio)
	Controller.load_audio(move_audio, Playerstats.move_audio, Setting.sound_volume - 5)#just to ensure move db is not 2 high
	Controller.load_audio(pu_audio, Playerstats.pickup_audio)
	space_ship.play()

func end():
	cleanup_weapons()
	space_ship.stop()
	timer.start()
	cd_timer.stop()
	sp_timer.stop()
	sp_bar_timer.stop()
	hide()

func set_volume(value):
	hurt_audio.volume_db = value
	move_audio.volume_db = value - 5
	pu_audio.volume_db = value

func cleanup_weapons():
	for i in weapons_rack.get_children():
		weapons_rack.remove_child(i)
		i.queue_free()

func init_weapons() -> void:
	var weapon_list = Playerstats.weapon_list
	var weapon_num = len(weapon_list)
	var unit = TAU / weapon_num
	for i in len(weapon_list):
		var new_weapon = Playerstats.weapon_scene.instantiate()
		new_weapon.position = new_weapon.position + Vector2(Playerstats.weapon_radius, 0).rotated(unit * i+PI/2)
		new_weapon.source = 1
		new_weapon.weapon_lv = weapon_list[i]["K_LV"]
		new_weapon.set_weapon(weapon_list[i])
		weapons_rack.add_child(new_weapon)

func _process(_delta: float):
	if glow_power == 20 or glow_power == 100:
		glow_speed*=-1
	space_ship.get_material().set_shader_parameter("glow_power", glow_power)
	#space_ship.get_material().set_shader_parameter("glow_shift", glow_power%10)
	#space_ship.get_material().set_shader_parameter("glow_radius", glow_power%10)
	glow_power+=glow_speed
	if Input.is_action_pressed("sp") and sp_ready and Controller.battle_start:
		trigger_sp()

func _physics_process(_delta: float):
	if Controller.battle_start:
		var player_velocity = Vector2.ZERO # The player's movement vector.
		if Input.is_action_pressed("move_right"):
			player_velocity.x += 1
		if Input.is_action_pressed("move_left"):
			player_velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			player_velocity.y += 1
		if Input.is_action_pressed("move_up"):
			player_velocity.y -= 1
		# if player_velocity.x != 0:
		# 	space_ship.flip_v = false
		# 	# See the note below about boolean assignment.
		# 	space_ship.flip_h = player_velocity.x < 0
		# elif player_velocity.y != 0:
		# 	space_ship.flip_v = player_velocity.y > 0

		global_rotation = (get_global_mouse_position() - global_position).angle()
		if player_velocity.length() > 0:
			player_velocity = player_velocity.normalized() * Playerstats.K_SPEED
			if !move_audio.playing:
				move_audio.play()
		else:
			if move_audio.playing:
				move_audio.stop()

		velocity = player_velocity
		move_and_slide()
		if global_position.x < 0:
			global_position.x = 0
		elif global_position.x > Controller.window_size.x:
			global_position.x = Controller.window_size.x
		if global_position.y < 0:
			global_position.y = 0
		elif global_position.y > Controller.window_size.y:
			global_position.y = Controller.window_size.y

func collect_item(key, value):
	pu_audio.play()
	if key == "bounty":
		Playerstats.bounty_count += (value + Playerstats.K_BOUNTY_GAIN)
		Playerstats.K_EXP += value
	else:
		Playerstats.add_item(key, value)

func take_damage(damage):
	if violable:
		if randi_range(0, 800) > Playerstats.K_EVASION:
			var took_dmg = max(1,damage - Playerstats.K_ARMOR)
			Playerstats.K_HP -= took_dmg
			hurt_audio.play()
			if Setting.dmg_display:
				show_val(-took_dmg)
		else:
			if Setting.dmg_display:
				show_miss()

func _on_one_second_timer_timeout() -> void:
	if Playerstats.K_HP_RECOVERY_RATE != 0:
		if Playerstats.K_HP != Playerstats.K_MAX_HP:
			show_val(Playerstats.K_HP_RECOVERY_RATE)
			Playerstats.K_HP += Playerstats.K_HP_RECOVERY_RATE

func show_miss():
	var ft = FLOAT_TEXT.instantiate()
	ft.set_text("miss")
	ft.velocity = Vector2(randf_range(-50,50),-100)
	ft.gravity = Vector2(0,2)
	ft.mass = 100
	Controller.battle_field.add_child(ft)

func show_val(val):
	var ft = FLOAT_TEXT.instantiate()
	if val > 0:
		ft.modulate = Color.GREEN
		ft.set_text(str(val))
	else:
		ft.modulate = Color.RED
		ft.set_text(str(val))
	ft.velocity = Vector2(randf_range(-50,50),-100)
	ft.gravity = Vector2(0, 2)
	ft.mass = 100
	Controller.battle_field.add_child(ft)

func call_sp_func(sp_func):  
	if sp_func in SP_FUNC_MAP:  
		SP_FUNC_MAP[sp_func].call()  

func sp_ready_to_call():
	sp_bar_timer.stop()
	Controller.hud.sp_bar.value = Playerstats.sp_dict["sp_cd"]
	Controller.hud.sp_label.text = "K_SP_READY"
	sp_ready = true
	if sp_auto:
		trigger_sp()

func prepare_sp():
	Controller.hud.sp_bar.value = 0
	sp_bar_timer.start()
	call_sp_func(Playerstats.sp_dict["sp_end"])
	sp_ready = false
	Controller.hud.sp_label.text = "K_SP_USED"
	cd_timer.start()

func trigger_sp():
	call_sp_func(Playerstats.sp_dict["sp_start"])
	sp_ready = false
	Controller.hud.sp_bar.value = 0
	Controller.hud.sp_label.text = "K_SP_WORKING"
	sp_timer.start()

func sp_bar_timer_timeout():
	Controller.hud.sp_bar.value += 1

func bullet_speed_norlmal():
	Controller.bullet_slow_down = false

func bullet_speed_slow():
	Controller.bullet_slow_down = true

func become_inviolable():
	violable = false

func become_violable():
	violable = true

func rapid_recover():
	Playerstats.K_HP = max(Playerstats.K_HP + Playerstats.K_HP_RECOVERY_RATE*20,Playerstats.K_MAX_HP) 

func do_nothing():
	pass

func divine_revelation():
	Playerstats.K_LV += 1

func mental_injuries():
	Playerstats.K_HP -= max(0, int(Playerstats.K_MAX_HP/2) - Playerstats.K_SANITY)

func cornucopia():
	Playerstats.bounty_count += (5 * Playerstats.K_BOUNTY_GAIN)

func cataclysm_start():
	Playerstats.K_HP =  max(1, Playerstats.K_HP - int(Playerstats.K_MAX_HP/2)) 

func cataclysm_end():
	get_tree().call_group("enemies", "take_damage", int(Playerstats.K_MAX_HP/2))
