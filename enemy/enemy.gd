extends Area2D


@onready var animation_player = $AnimationPlayer
@onready var attack_timer: Timer = $AttackTimer
@onready var audio_stream_player = $AudioStreamPlayer
@onready var sprite_2d = $Sprite2D

@export var K_SPEED: float = 5
@export var K_HP: int = 10

const item = preload("res://items/item.tscn")
const FLOAT_TEXT = preload("res://float_text.tscn")
const WEAPON = preload("res://weapon.tscn")

var enemy_name = "enemy"
var body_damage = 10
var dir:Vector2
var target = null
var last_hit
var body_damage_interval = 1
var walk_anim
var hurt_anim
var die_anim
var target_player_rate = 0
var min_dis: float = 0.0
var alert_dis: float = 0.0
var pause_count = 0
var pause_num = 0
var walking:bool

func set_volume(value):
	audio_stream_player.volume_db = value - 5
# Called when the node enters the scene tree for the first time.
func _ready():
	var allies_list = get_tree().get_nodes_in_group("allies")
	if  allies_list!= [] and target_player_rate > randi_range(0,100):
			target = allies_list.pick_random()
	else:
		target = get_tree().get_first_node_in_group("player")
	attack_timer.set_wait_time(body_damage_interval)
	walk()

func init(enemy_name_i):
	var enemy_info = NpcSettings.enemy[enemy_name_i]
	enemy_name = enemy_name_i
	body_damage = enemy_info["body_dmg"] * Setting.enemy_damage
	K_SPEED = enemy_info["K_SPEED"] * Setting.enemy_speed
	body_damage_interval = enemy_info["body_dmg_interval"]
	K_HP = enemy_info["K_HP"]
	target_player_rate = enemy_info["target_player_rate"]
	walk_anim = enemy_info["walk_anim"]
	hurt_anim = enemy_info["hurt_anim"]
	die_anim = enemy_info["die_anim"]
	pause_num = enemy_info["pause_num"]

	if enemy_info.has("weapon_list"):
		var weapon_list = enemy_info["weapon_list"]
		for i in len(weapon_list):
			var new_weapon = WEAPON.instantiate()
			var weapon_dict = WeaponSetting.weapons_data[weapon_list[i]["K_WEAPON_NAME"]].duplicate()
			new_weapon.source = -1
			new_weapon.weapon_lv = weapon_list[i]["K_LV"]
			new_weapon.bullet_damage = (weapon_dict["K_ATK"] * pow(2,weapon_list[i]["K_LV"]-1) + pow(2,weapon_list[i]["K_LV"]-1) * weapon_dict["K_GROWTH"]) * Setting.enemy_damage
			new_weapon.set_weapon(weapon_dict)
			add_child(new_weapon)
			if weapon_dict["K_ATK_RNG"] > min_dis or min_dis == 0:
				min_dis = weapon_dict["K_ATK_RNG"]
		min_dis *= 0.95
		alert_dis = min_dis * 0.8

func take_damage(damage :int):
	K_HP -= damage
	if Setting.dmg_display:
		show_val(-damage)
	if K_HP > 0:
		if walking:
			walking = false
			pause_count = pause_num
			animation_player.play(hurt_anim)
	else:
		animation_player.play(die_anim)

func _physics_process(delta: float) -> void:
	if pause_count > 0:
		pause_count -= 1
	else:
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
	sprite_2d.flip_v = dir.x < 0
	if global_position.x < Controller.window_size_x_min || global_position.y < Controller.window_size_y_min || \
		global_position.x > Controller.window_size_x_max || global_position.y > Controller.window_size_y_max:
			global_position += self.global_position.direction_to(Controller.window_zone) * K_SPEED * delta * 2

func walk() -> void:
	walking = true
	animation_player.play(walk_anim)

func die() -> void:
	var itemDict = NpcSettings.enemy[enemy_name]["itemDict"]
	var bounty_item = item.instantiate()
	bounty_item.position = self.global_position
	bounty_item.key = "bounty"
	bounty_item.val = itemDict["bounty"]
	bounty_item.texture = Setting.Items["bounty"]["K_IMG"]
	Controller.battle_field.add_child(bounty_item)
	if itemDict.size() > 1:
		var rand_val = randi_range(0, 1000)
		for i in itemDict:
			if i!= "bounty" and rand_val < itemDict[i]:
				var new_item = item.instantiate()
				new_item.position = self.global_position + Vector2(randi_range(-2,2),randi_range(-2,2))
				new_item.key = i
				new_item.val = rand_val
				new_item.texture = Setting.Items[i]["K_IMG"]
				Controller.battle_field.add_child(new_item)
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage(body_damage)
		last_hit = body
		attack_timer.start()

func _on_attack_timer_timeout() -> void:
	if overlaps_body(last_hit):
		last_hit.take_damage(body_damage)
		attack_timer.start()
	else:
		attack_timer.stop()

func show_val(val):
	var ft = FLOAT_TEXT.instantiate()
	ft.modulate = Color.YELLOW
	ft.set_text(str(val))
	ft.velocity = Vector2(randf_range(-50,50),-100)
	ft.gravity = Vector2(0, 2)
	ft.mass = 100
	ft.global_position = self.global_position
	Controller.battle_field.add_child(ft)
