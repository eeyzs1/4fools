extends Area2D

@onready var audio_stream_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer
@export var K_SPEED: float = 5
@export var K_HP: int = 10
@onready var hp = $HP
@onready var sprite_2d = $Sprite2D

const FLOAT_TEXT = preload("res://float_text.tscn")
const TRACE_BULLET = preload("res://trace_bullet.tscn")
const WEAPON = preload("res://weapon.tscn")
#Timer.new()


var dir:Vector2
var target = null
var source
var walk_anim
var hurt_anim
var die_anim
var target_player_rate = 0
var min_dis: float = 0.0
var alert_dis: float = 0.0
var action_mode = 0 #0 is surround, 1 is away
var is_ally = false
var destroy_stage_index = 0
var sat_ls:Array
var sat_dict
var sat_timer:Timer
var debutant_lines:Array
var index = 0
var div_hp = 0
var itemDict
var walking = false
var snpc_info
var sat_bullet_delay = 10
var enemy_snpcs = []

func _ready():
	hp.max_value = K_HP
	hp.value = K_HP
	if !is_ally:
		hp["self_modulate"] =  Color(1,0,0,1)
		target = Controller.player
	else:
		var snpcs = get_tree().get_nodes_in_group("snpcs")
		for i in snpcs:
			if i.is_in_group("enemies"):
				enemy_snpcs.append(i)
		target = enemy_snpcs[0]
	global_position = Vector2(randi_range(-Controller.window_size_x_min,Controller.window_size_x_max), \
	randi_range(-Controller.window_size_y_min,Controller.window_size_y_max))
	walk()
	if snpc_info.has("sat_dict"):
		sat_dict = snpc_info["sat_dict"].duplicate()
		sat_ls = []
		sat_timer = Timer.new()
		add_child(sat_timer)
		sat_timer.set_wait_time(snpc_info["sat_cd"])
		sat_timer.timeout.connect(call_sat)
		sat_timer.start()
		for i in sat_dict:
			var bullet_texture = load(sat_dict[i]["bullet_img"])
			sat_dict[i].merge({"bullet_texture":bullet_texture})
			sat_ls.append(i)
			var cd_timer = Timer.new()
			add_child(cd_timer)
			cd_timer.set_wait_time(sat_dict[i]["cd"])
			cd_timer.timeout.connect(sat_ready.bind(i))
			cd_timer.start()

func walk() -> void:
	walking = true
	animation_player.play(walk_anim)

func set_snpc(snpc_rc, snpc_name):
	if snpc_rc.has("is_ally"):
		is_ally = snpc_rc["is_ally"]
	else:
		is_ally = false
	if snpc_rc.has("action_mode"):
		action_mode = snpc_rc["action_mode"]
	else:
		action_mode = 0
	if snpc_rc.has("destroy_stage_index"):
		destroy_stage_index = snpc_rc["destroy_stage_index"]
	else:
		destroy_stage_index = 0
	if snpc_rc.has("debutant_lines"):
		debutant_lines = snpc_rc["debutant_lines"]
	else:
		debutant_lines = []
	index = debutant_lines.size()
	if is_ally:
		source = 2
		add_to_group("allies")
	else:
		source = -1
		add_to_group("enemies")
	snpc_info = NpcSettings.snpc[snpc_name]
	itemDict = snpc_info["itemDict"]
	K_SPEED = snpc_info["K_SPEED"] * Setting.enemy_speed
	K_HP = snpc_info["K_HP"]
	if debutant_lines.size() > 0:
		div_hp = float(K_HP)/debutant_lines.size()
	walk_anim = snpc_info["walk_anim"]
	hurt_anim = snpc_info["hurt_anim"]
	die_anim = snpc_info["die_anim"]
	var weapon_list = snpc_info["weapon_list"]
	var unit = TAU / weapon_list.size()
	for i in len(weapon_list):
		var new_weapon = WEAPON.instantiate()
		var weapon_dict = WeaponSetting.weapons_data[weapon_list[i]["K_WEAPON_NAME"]].duplicate()
		new_weapon.source = source
		new_weapon.position = new_weapon.position + Vector2(20, 0).rotated(unit * i+PI/2)
		new_weapon.weapon_lv = weapon_list[i]["K_LV"]
		new_weapon.bullet_damage = weapon_dict["K_ATK"] * Setting.enemy_damage * pow(2,weapon_list[i]["K_LV"]-1) + pow(2,weapon_list[i]["K_LV"]-1) * weapon_dict["K_GROWTH"]
		new_weapon.set_weapon(weapon_dict)
		add_child(new_weapon)
		if weapon_dict["K_ATK_RNG"] > min_dis or min_dis == 0:
			min_dis = weapon_dict["K_ATK_RNG"]
		if weapon_dict["K_ATK_RNG"] < alert_dis or alert_dis == 0:
			alert_dis = weapon_dict["K_ATK_RNG"]
	if min_dis == alert_dis:
		min_dis *= 0.9
		alert_dis = min_dis * 0.3

func sat_ready(num):
	sat_ls.append(num)

func call_sat():
	if sat_ls.size() > 0:
		var sat_index = sat_ls.pop_front()
		var sat_info = sat_dict[sat_index]
		walking = false
		animation_player.play(sat_info["sat_anim"])
		var bullet_damage = sat_info["dmg"]
		var num = sat_info["num"]
		var bullet_speed = sat_info["speed"]
		var trace_num = sat_info["trace_num"]
		var bullet_texture = sat_info["bullet_texture"]
		var bullet_direction
		bullet_direction = self.global_position.direction_to(target.global_position)
		var sat_pattern = sat_index%4
		if sat_pattern == 0:
			var Tau = 2*PI/num
			for i in range(num+1):
				var new_trace_bullet = TRACE_BULLET.instantiate()
				new_trace_bullet.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, global_position, bullet_direction.rotated(Tau*(i-num/2)), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet)
		elif sat_pattern == 1:
			var Tau = PI/num
			var left_pos = global_position + Vector2(5,0)
			var right_pos = global_position + Vector2(-5,0)
			for i in range(num+1):
				var rotate_angle = Tau*(i-num/2)
				var new_trace_bullet1 = TRACE_BULLET.instantiate()
				new_trace_bullet1.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, left_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet1)
				var new_trace_bullet2 = TRACE_BULLET.instantiate()
				new_trace_bullet2.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, right_pos, bullet_direction.rotated(-rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet2)
		elif sat_pattern == 2:
			var Tau = PI/num
			var lt_pos = global_position + Vector2(-5,-5)
			var rt_pos = global_position + Vector2(5,-5)
			var lb_pos = global_position + Vector2(-5,5)
			var rb_pos = global_position + Vector2(5,5)
			for i in range(num+1):
				var rotate_angle = Tau*(i-num/2)
				var new_trace_bullet1 = TRACE_BULLET.instantiate()
				new_trace_bullet1.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, lt_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet1)
				var new_trace_bullet2 = TRACE_BULLET.instantiate()
				new_trace_bullet2.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, rt_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet2)
				var new_trace_bullet3 = TRACE_BULLET.instantiate()
				new_trace_bullet3.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, lb_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet3)
				var new_trace_bullet4 = TRACE_BULLET.instantiate()
				new_trace_bullet4.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, rb_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet4)
		elif sat_pattern == 3:
			var Tau = 2*PI/num
			var lt_pos = global_position + Vector2(-5,-5)
			var rt_pos = global_position + Vector2(5,-5)
			var lb_pos = global_position + Vector2(-5,5)
			var rb_pos = global_position + Vector2(5,5)
			for i in range(num+1):
				var rotate_angle = Tau*(i-num/2)
				var new_trace_bullet1 = TRACE_BULLET.instantiate()
				new_trace_bullet1.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, lt_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet1)
				var new_trace_bullet3 = TRACE_BULLET.instantiate()
				new_trace_bullet3.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, lb_pos, bullet_direction.rotated(rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet3)
				var new_trace_bullet2 = TRACE_BULLET.instantiate()
				new_trace_bullet2.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, rt_pos, bullet_direction.rotated(-rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet2)
				var new_trace_bullet4 = TRACE_BULLET.instantiate()
				new_trace_bullet4.set_bullet(source,bullet_speed, bullet_texture, bullet_damage, 
					trace_num, target, rb_pos, bullet_direction.rotated(-rotate_angle), i*sat_bullet_delay)
				Controller.battle_field.add_child(new_trace_bullet4)

func set_volume(value):
	audio_stream_player.volume_db = value

func _physics_process(delta):
	if target == null:
		while enemy_snpcs.size() > 0 and enemy_snpcs[0] == null:
			enemy_snpcs.pop_front()
		if enemy_snpcs.size() > 0:
			target = enemy_snpcs[0]
		else:
			target = Controller.player
	if action_mode == 0:
		var distance = self.global_position.distance_to(target.global_position)
		if  distance > min_dis:
			dir = self.global_position.direction_to(target.global_position)
			global_position += dir * K_SPEED * delta
			global_rotation = dir.angle()
		elif distance < alert_dis:
			dir = target.global_position.direction_to(self.global_position)
			global_position += dir * K_SPEED * delta
		else:
			dir = self.global_position.direction_to(target.global_position)
			global_rotation = dir.angle()
	else:
		dir = target.global_position.direction_to(self.global_position)
		global_rotation = dir.angle()
		global_position += dir.rotated(-PI * self.global_position.distance_to(Controller.window_zone)/Controller.window_zone.length()) * K_SPEED * delta
	if global_position.x < Controller.window_size_x_min || global_position.y < Controller.window_size_y_min || \
		global_position.x > Controller.window_size_x_max || global_position.y > Controller.window_size_y_max:
			global_position += self.global_position.direction_to(Controller.window_zone) * K_SPEED * delta * 2
	sprite_2d.flip_v = dir.x < 0

func take_damage(damage):
	K_HP -= damage
	hp.value = K_HP
	if Setting.dmg_display:
		show_val(-damage)
	if K_HP > 0:
		if K_HP < div_hp*index and index > 0:
			show_debutant_line(debutant_lines[index - 1])
			index -= 1
		if walking:
			animation_player.play(hurt_anim)
	else:
		animation_player.play(die_anim)

func show_val(val):
	var ft = FLOAT_TEXT.instantiate()
	ft.modulate = Color.RED
	ft.set_text(str(val))
	ft.velocity = Vector2(randf_range(-50,50),-100)
	ft.gravity = Vector2(0, 2)
	ft.mass = 100
	ft.global_position = self.global_position
	Controller.battle_field.add_child(ft)

func show_debutant_line(val):
	var ft = FLOAT_TEXT.instantiate()
	ft.get_node("text")["size"].x = 200
	ft.set_text(val)
	ft.modulate_time = 10
	ft.global_position = self.global_position
	Controller.battle_field.add_child(ft)

func die() -> void:
	if !is_ally:
		for i in itemDict:
			if i == "bounty":
				Playerstats.bounty_count += itemDict[i]
				Playerstats.K_EXP += itemDict[i]
			else:
				Playerstats.add_item(i, itemDict[i])
	if destroy_stage_index:
		Setting.next_stage_index = destroy_stage_index
	queue_free()
