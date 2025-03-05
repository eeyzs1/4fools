extends Node2D
@onready var summary = $Summary
@onready var hud: CanvasLayer = $HUD
@onready var market: CanvasLayer = $Market
@onready var lvup: CanvasLayer = $lvup
@onready var player: Player = $Player
@onready var pause: CanvasLayer = $Pause
@onready var load_save: CanvasLayer = $LoadSave
@onready var settings: CanvasLayer = $Settings
@onready var stage: CanvasLayer = $Stage
@onready var sound: AudioStreamPlayer = $Sound
@onready var music: AudioStreamPlayer = $Music
@onready var ui_focus_sound = $UIFocusSound
@onready var ui_click_sound = $UIClickSound
@onready var enemy_manager: Node2D = $Enemy_manager
@onready var battle_field = $BattleField

const SNPC = preload("res://player/snpc.tscn")

var bullet_slow_down : bool = false

var battle_start = false
var battle_field_info
var snpc_list

var market_start = false
var game_start = false
var main_scene

var window_size
var window_zone
var window_size_x_min = 0.0
var window_size_x_max =0.0
var window_size_y_min = 0.0
var window_size_y_max = 0.0
var enemy_spawn_zone

var is_on_steam: bool = false
var steam_connected:bool = false
var epic_local_user_id = ""
var epic_product_user_id = ""

func _ready():
	#todo, remember to change scene form srart scene
	main_scene = get_tree().root.get_child(get_tree().root.get_child_count() - 1)
	Controller.music.volume_db = Setting.music_volume
	Controller.sound.volume_db = Setting.sound_volume
	Controller.ui_focus_sound.volume_db = Setting.sound_volume
	Controller.ui_click_sound.volume_db = Setting.sound_volume
	var viewport = get_tree().get_root().get_viewport()
	viewport.size_changed.connect(save_window_size)
	update_window_size()
	init()
	settings.init.call_deferred()

func init():
	battle_field.hide()
	lvup.hide()
	pause.hide()
	load_save.hide()
	settings.hide()
	hud.hide()
	stage.hide()
	market.hide()
	summary.hide()
	play_music("res://asset/music/stage/ATaleForTheJourney.ogg")
	var arrow = load("res://asset/cursor.png")
	Input.set_custom_mouse_cursor(arrow)
	#steam part
	if Engine.has_singleton("Steam"):
		OS.set_environment("SteamAppId", str(3180460))
		OS.set_environment("SteamGameId", str(3180460))
		var init_response: Dictionary = Steam.steamInit(false)
	 	# If the status isn't one, print out the possible error and quit the program
		if init_response['status'] != 1:
			steam_connected = false
		else:
			if Steam.loggedOn() and Steam.isSubscribed():
				is_on_steam = true
				var error : int = Steam.current_stats_received.connect(_on_current_stats_received)
				if not Steam.requestCurrentStats():
					steam_connected = false
#
	#if Engine.has_singleton("IEOS"):
		## -AUTH_LOGIN=unused -AUTH_PASSWORD=<password> -AUTH_TYPE=exchangecode 
		## -epicapp=<appid> -epicenv=Prod -EpicPortal  
		## -epicusername=<username> -epicuserid=<userid> -epiclocale=en-US 
		## -epicsandboxid=<sandboxid> -epicdeploymentid=<deploymentid>
		#var args = OS.get_cmdline_args()
		#if args.size() > 0 and args[0].begins_with("-AUTH_LOGIN="):
			#var password = args[1].split("=")[1]
			#epic_local_user_id = args[-4].split("=")[1]
			#var init_opts = EOS.Platform.InitializeOptions.new()
			#init_opts.product_name = "4fools1"
			#init_opts.product_version = "1.58"
			#var init_res := EOS.Platform.PlatformInterface.initialize(init_opts)
			#IEOS.auth_interface_login_callback.connect(_on_auth_interface_login_callback)
			#IEOS.auth_interface_logout_callback.connect(_on_auth_interface_logout_callback)
			#IEOS.achievements_interface_achievements_unlocked_v2_callback.connect(_on_achievements_interface_achievements_unlocked_v2_callback)
			#IEOS.achievements_interface_unlock_achievements_callback.connect(_on_achievements_interface_unlock_achievements_callback)
			#IEOS.connect_interface_login_callback.connect(_on_connect_interface_login_callback)
			#var init_retry_count = 10
			#while not EOS.is_success(init_res) and init_retry_count > 0:
				#init_res = EOS.Platform.PlatformInterface.initialize(init_opts)
				#init_retry_count -= 1
				#await get_tree().create_timer(0.2).timeout
#
			#if not EOS.is_success(init_res):
				#return
#
			## Create platform
			#var create_opts = EOS.Platform.CreateOptions.new()
			#create_opts.product_id = ""
			#create_opts.sandbox_id = args[-2].split("=")[1]
			#create_opts.deployment_id = args[5].split("=")[1]
			#create_opts.client_id = ""
			#create_opts.client_secret = ""
			##create_opts.encryption_key = "ENCRYPTION_KEY_HERE"
#
			## Enable Social Overlay on Windows
			#if OS.get_name() == "Windows":
				#create_opts.flags = EOS.Platform.PlatformFlags.WindowsEnableOverlayOpengl
#
			#var create_success: bool = EOS.Platform.PlatformInterface.create(create_opts)
			#var create_retry_count = 20
			#while not create_success&&create_retry_count > 0:
				#create_success = EOS.Platform.PlatformInterface.create(create_opts)
				#create_retry_count -= 1
				#await get_tree().create_timer(0.2).timeout
			#if not create_success:
				#return
			#else:
				#IEOS.auth_interface_login_callback.connect(_on_auth_interface_login_callback)
				#IEOS.auth_interface_logout_callback.connect(_on_auth_interface_logout_callback)
#
				#var credentials = EOS.Auth.Credentials.new()
				#credentials.type = EOS.Auth.LoginCredentialType.ExchangeCode
				#credentials.token = password
#
				#var login_options = EOS.Auth.LoginOptions.new()
				#login_options.credentials = credentials
				#login_options.scope_flags = EOS.Auth.ScopeFlags.BasicProfile
				#login_options.user_login_info = EOS.Connect.UserLoginInfo.new()
				#EOS.Auth.AuthInterface.login(login_options)
#
#
#func _on_auth_interface_login_callback(data: Dictionary):
	#epic_local_user_id = data.local_user_id
	#if epic_local_user_id != "":
		#var copy_user_auth_token = EOS.Auth.AuthInterface.copy_user_auth_token(EOS.Auth.CopyUserAuthTokenOptions.new(), epic_local_user_id)
		#var token = copy_user_auth_token.token
		## Get user info of logged in user
		#var options = EOS.UserInfo.QueryUserInfoOptions.new()
		#options.local_user_id = epic_local_user_id
		#options.target_user_id = epic_local_user_id
		#EOS.UserInfo.UserInfoInterface.query_user_info(options)
		## Connect the account to get a Product User Id from the Epic Account Id
		#connect_account(EOS.ExternalCredentialType.Epic, token.access_token)
#
#func connect_account(type: int, token = null, display_name = null):
	#var credentials = EOS.Connect.Credentials.new()
	#credentials.token = token
	#credentials.type = type
	#var login_options = EOS.Connect.LoginOptions.new()
	#login_options.credentials = credentials
	#if display_name:
		#login_options.user_login_info = EOS.Connect.UserLoginInfo.new()
		#login_options.user_login_info.display_name = display_name
	#EOS.Connect.ConnectInterface.login(login_options)
#
#func _on_connect_interface_login_callback(data: Dictionary):
	#epic_local_user_id = data.local_user_id
	#if data.continuance_token:
		#var ctw = data.continuance_token
		## Create user
		#var create_user_options = EOS.Connect.CreateUserOptions.new()
		#create_user_options.continuance_token = ctw
		#EOS.Connect.ConnectInterface.create_user(create_user_options)
		#var ret = await IEOS.connect_interface_create_user_callback
		#epic_product_user_id = ret.local_user_id
	#elif data.local_user_id != "":
		#epic_product_user_id = data.local_user_id
#
#func _on_auth_interface_logout_callback(data: Dictionary):
	#pass
#
#func _on_achievements_interface_achievements_unlocked_v2_callback(data: Dictionary):
	#pass
#
#func _on_achievements_interface_unlock_achievements_callback(data: Dictionary):
	#pass


func _process(delta: float) -> void:
	if is_on_steam:
		Steam.run_callbacks()

func exit_game():
	if Engine.has_singleton("Steam"):
		Steam.steamShutdown
	#if epic_local_user_id != "":
		#var logout_options = EOS.Auth.LogoutOptions.new()
		#logout_options.local_user_id = epic_local_user_id
		#EOS.Auth.AuthInterface.logout(logout_options)
		#await get_tree().create_timer(0.5).timeout
	get_tree().quit() 


func _on_current_stats_received(game: int, result: bool, user: int) -> void:
	steam_connected = true


func save_window_size():
	update_window_size()
	enemy_spawn_zone = Controller.window_size - Vector2i(Controller.window_size_x_min, Controller.window_size_y_min)
	Setting.resolution_x = window_size.x
	Setting.resolution_y = window_size.y
	Setting.save_config()
	settings.update_resolution_item()
	player.update_canmera_limit()

func update_window_size():
	window_size = get_window().size
	window_zone = get_window().size/2
	window_size_x_min = window_size.x * 0.01
	window_size_x_max = window_size.x * 0.99
	window_size_y_min = window_size.y * 0.01
	window_size_y_max = window_size.y * 0.99

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel") and battle_start:
		if get_tree().paused:
			pause.hide()
			get_tree().paused = false
		else:
			get_tree().paused = true
			pause.show()
			pause.init()

func continue_game():
	get_tree().paused = false
	pause.hide()

func load_save_game():
	load_save.show()
	load_save.init()

func load_save_back():
	load_save.hide()
	if get_tree().paused:
		pause.hide()
		get_tree().paused = false
	if !game_start and !battle_start:
		main_scene.canvas_layer.show()
	elif battle_start:
		battle_field.show()
	elif Playerstats.K_UPGRADE_COUNT > 0:
		show_lvup()
	elif market_start:
		show_market()
	else:
		show_stage()

func show_settings():
	settings.show()

func settings_back():
	Setting.save_config()
	settings.hide()
	if get_tree().paused:
		pause.hide()
		get_tree().paused = false
	if !game_start and !battle_start:
		main_scene.canvas_layer.show()
	elif battle_start:
		battle_field.show()
	elif Playerstats.K_UPGRADE_COUNT > 0 and Playerstats.K_HP > 0:
		show_lvup()
	elif market_start and Playerstats.K_HP > 0:
		show_market()
	else:
		show_stage()

func launch_player():
	load_save.hide()
	if get_tree().paused:
		pause.hide()
		get_tree().paused = false
	if Playerstats.level_mode:
		if battle_start:
			launch_level()
		elif Playerstats.K_UPGRADE_COUNT > 0 and Playerstats.K_HP > 0:
			show_lvup()
		elif market_start and Playerstats.K_HP > 0:
			show_market()
		else:
			launch_level()
	else:
		if battle_start:
			launch_battle()
		elif Playerstats.K_UPGRADE_COUNT > 0 and Playerstats.K_HP > 0:
			show_lvup()
		elif market_start:
			show_market()
		else:
			show_stage()

func play_ui_focus_sound():
	play_audio(ui_focus_sound)

func play_ui_click_sound():
	play_audio(ui_click_sound)

func play_music(path):
	load_audio(music, path, Setting.music_volume, true)
	music.play(0)

func play_sound(path):
	load_audio(sound, path, Setting.sound_volume)
	sound.play(0)

func load_audio(audio_player:AudioStreamPlayer, path, volume:=Setting.sound_volume, loop := false, audio_bus := "Master"):
	if audio_player.playing:
		audio_player.stop()
	audio_player.stream = load(path)
	audio_player.volume_db = volume
	audio_player.bus = audio_bus
	if not audio_player.stream is AudioStreamWAV:
		if "loop" in audio_player.stream:
			audio_player.stream.loop = loop
	elif "loop_mode" in audio_player.stream:
		if loop:
			audio_player.stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
		else:
			audio_player.stream.loop_mode = AudioStreamWAV.LOOP_DISABLED

func play_audio(audio_player:AudioStreamPlayer):
	var new_sound_node = audio_player.duplicate()
	add_child(new_sound_node)
	new_sound_node.play()
	new_sound_node.finished.connect(new_sound_node.queue_free)

#Neutral market
#The market of the Imperial market
#Alliance Market
#Alien market

func start_game():
	game_start = true
	Setting.next_stage_index = 1
	show_stage()

func back_to_main():
	if get_tree().paused:
		pause.hide()
		get_tree().paused = false
	if battle_start:
		battle_field.hide()
		battle_start = false
		player.hide()
		clean_battlefield()
	init()
	main_scene.canvas_layer.show()

func launch_battle():
	Playerstats.K_HP = Playerstats.K_MAX_HP
	battle_start = true
	battle_field_info = Setting.battle_field
	player.global_position = get_window().size/2
	if battle_field_info.has("special_npc_list"):
		snpc_list = battle_field_info["special_npc_list"]
		for i in snpc_list:
			var snpc_inst = SNPC.instantiate()
			snpc_inst.set_snpc(i, i["name"])
			battle_field.add_child(snpc_inst)
	battle_field.set_map(battle_field_info["map"])
	hud.start_timer(max(5,battle_field_info["basic_time"] + Playerstats.K_EFFICIENCY))
	play_music(battle_field_info["battle_music"])
	hud.show()
	enemy_manager.set_enemy_name_list(battle_field_info["enemy_list"])
	enemy_manager.set_enemy_multiplier(battle_field_info["enemy_multiplier"])
	enemy_manager.start_enemy_spawn_timer(Setting.enemy_spawn_period)
	player.start()
	load_save._on_quick_save_game_button_pressed()
	battle_field.show()

#as long as 1 side failed or timeout, the battle finished
func battle_finished():
	if Playerstats.level_mode:
		battle_field.hide()
		battle_start = false
		player.hide()
		clean_battlefield()
		if Playerstats.level_mode >= 20:
			Controller.play_music("res://asset/music/stage/ATaleForTheJourney.ogg")
			game_over("LMEND")#todo
		else:
			Playerstats.level_mode += 1
			if Playerstats.K_UPGRADE_COUNT > 0:
				show_lvup()
			else:
				show_market()
	else:
		battle_field.hide()
		battle_start = false
		Setting.need_battle = false
		Setting.battle_field = null
		player.hide()
		if battle_field_info.has("fail_stage_index"):
			if Playerstats.K_UPGRADE_COUNT > 0:
				show_lvup()
			else:
				show_market()
		else:
			if Playerstats.K_UPGRADE_COUNT > 0:
				show_lvup()
			else:
				show_market()
		clean_battlefield()

#hp <=0
func battle_failed():
	if Playerstats.level_mode:
		battle_start = false
		Setting.need_battle = false
		Setting.battle_field = null
		player.hide()
		clean_battlefield()
		Controller.play_music("res://asset/music/stage/Death Crew.ogg")
		game_over("COMFE")
	else:
		battle_start = false
		Setting.need_battle = false
		Setting.battle_field = null
		player.hide()
		clean_battlefield()
		if battle_field_info.has("fail_stage_index"):
			Setting.next_stage_index = battle_field_info["fail_stage_index"]
			show_stage()
		else:
			game_over("COMFE")

func game_over(end):
	stage.hide()
	lvup.hide()
	market.hide()
	battle_field.hide()
	summary.show()
	summary.init(end)

func clean_battlefield():
	enemy_manager.stop_enemy_spawn_timer()
	get_tree().call_group("allies", "queue_free")
	get_tree().call_group("enemies", "queue_free")
	get_tree().call_group("bullets", "queue_free")
	get_tree().call_group("items", "queue_free")
	player.end()

func show_lvup():
	lvup.show()
	lvup.init()

func show_market():
	hud.hide()
	if Playerstats.level_mode:
		market_start = true
		var all_items_price = Setting.market_dict["super_market"]["item_list"]
		var product_list = []
		for i in all_items_price:
			if i[1] < Playerstats.bounty_count:
				product_list.append([i[0],int(i[1]*randf_range(0.8,1.2))])
		var random_market = {
			"bg_image": Setting.MAKRET_BGI.pick_random(),
			"bg_music": Setting.MAKRET_BGM.pick_random(),
			"salesperson": Setting.MAKRET_SP.pick_random(),
			"patience": randi_range(80+Playerstats.level_mode,240+Playerstats.level_mode),
			"item_list": product_list
		}
		market.show()
		market.init(random_market)
	elif Setting.market_dict.has(Setting.market_name):
		market_start = true
		market.show()
		market.init(Setting.market_dict[Setting.market_name])
	else:
		show_stage()

func market_end():
	market_start = false
	market.hide()
	if Playerstats.level_mode:
		launch_level()
	else:
		show_stage()

func show_stage():
	Setting.stage_index = Setting.next_stage_index
	Setting.line_index = 0
	Setting.scenario_index = 0
	stage.show()
	stage.init()

func restart_battle():
	clean_battlefield()
	if get_tree().paused:
		pause.hide()
		get_tree().paused = false
	load_save._on_quick_load_game_button_pressed()

func launch_level():
	if Playerstats.level_mode < 21:
		Playerstats.K_HP = Playerstats.K_MAX_HP
		battle_start = true
		battle_field_info = NpcSettings.LV_FIELD[Playerstats.level_mode]
		player.global_position = get_window().size/2
		if battle_field_info.has("special_npc_list"):
			snpc_list = battle_field_info["special_npc_list"]
			for i in snpc_list:
				var snpc_inst = SNPC.instantiate()
				snpc_inst.set_snpc(NpcSettings.snpc[i], i)
				battle_field.add_child(snpc_inst)
		battle_field.set_map(NpcSettings.battle_field_maps.pick_random())
		hud.start_timer(max(5, battle_field_info["basic_time"] + Playerstats.K_EFFICIENCY))
		play_music(NpcSettings.battle_field_bgms.pick_random())
		hud.show()
		enemy_manager.set_enemy_name_list(battle_field_info["enemy_list"])
		enemy_manager.set_enemy_multiplier(battle_field_info["enemy_multiplier"])
		enemy_manager.start_enemy_spawn_timer(Setting.enemy_spawn_period)
		player.start()
		load_save._on_quick_save_game_button_pressed()
		battle_field.show()
	else:
		Controller.play_music("res://asset/music/stage/ATaleForTheJourney.ogg")
		game_over("LMEND")#todo

#
#func goto_scene(path):
	## This function will usually be called from a signal callback,
	## or some other function in the current scene.
	## Deleting the current scene at this point is
	## a bad idea, because it may still be executing code.
	## This will result in a crash or unexpected behavior.
	## The solution is to defer the load to a later time, when
	## we can be sure that no code from the current scene is running:
	#call_deferred("_deferred_goto_scene", path)
#
#
#func _deferred_goto_scene(path):
	## It is now safe to remove the current scene.
	#current_scene.free()
#
	## Load the new scene.
	#var s = ResourceLoader.load(path)
#
	## Instance the new scene.
	#current_scene = s.instantiate()
#
	## Add it to the active scene, as child of root.
	#get_tree().root.add_child(current_scene)
#
	## Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	#get_tree().current_scene = current_scene
