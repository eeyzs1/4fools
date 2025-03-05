class_name weapon
extends Node2D
@onready var weapon_sprite: Sprite2D = $WeaponSprite
@onready var shoot_pos = $ShootPosition
@onready var timer = $Timer
@onready var audio_stream_player = $AudioStreamPlayer
@onready var BULLET_SCENE = preload("res://bullet.tscn") ##the godot cant instantiate the set 

var weapon_data
var weapon_lv: float = 1.0
var can_shoot: bool = true
var attack_interval: float = 1.0
var bullet_damage = 1
var detected_enemies = []
var explosion_range = 0
var explosion_dmg = 0
var throughpass_count = 0
var ricochet_count = 0
var split_count = 0
var K_ACCURACY = 0
var K_CRIT_RATE = 0
var source
var bullet_speed = 3
var bullet_texture
var exp_texture = null
var weapon_texture_path = null
var audio_path = "res://asset/weapon/sound/1.wav"

func _ready() -> void:
	if source != 1:
		weapon_sprite["modulate"] = Color(0, 0, 0, 0)
	else:
		weapon_sprite.texture = load(weapon_texture_path)
		bullet_speed += Playerstats.K_SPEED/100
		weapon_sprite.get_material().set_shader_parameter("line_color", WeaponSetting.weapons_level_color[weapon_lv])
	timer.set_wait_time(attack_interval)
	if source == 1:
		Controller.load_audio(audio_stream_player, audio_path)

func set_volume(value):
	if audio_stream_player:
		audio_stream_player.volume_db = value

func set_weapon(weapon_dict):
	$AttackChecker.shape.radius = weapon_dict["K_ATK_RNG"]
	weapon_texture_path = weapon_dict["K_IMG"]
	attack_interval = weapon_dict["K_ATK_INTVL"]
	bullet_damage = weapon_dict["K_ATK"]
	explosion_range = weapon_dict["K_EXPL_RNG"]
	explosion_dmg = weapon_dict["K_EXPL_DMG"]
	throughpass_count = weapon_dict["K_TP"]
	ricochet_count = weapon_dict["K_RICO"]
	split_count = weapon_dict["K_SPL"]
	K_ACCURACY = weapon_dict["K_ACCURACY"]
	K_CRIT_RATE = weapon_dict["K_CRIT_RATE"]
	bullet_texture = load(weapon_dict["bullet_img"])
	audio_path = weapon_dict["audio"]
	if weapon_dict.has("explosion_img") and explosion_range > 0:
		var exp_image = load(weapon_dict["explosion_img"]).get_image()
		exp_image.resize(explosion_range, explosion_range, 4)
		exp_texture = ImageTexture.create_from_image(exp_image)


func _process(_delta: float) -> void:
	if source == 1 and Setting.munually_attack:
		self.look_at(get_global_mouse_position())
		if can_shoot and Input.is_action_pressed("shoot"):
			shoot_bullets(get_global_mouse_position())
	elif detected_enemies.size() > 0:
		self.look_at(detected_enemies[0].global_position)
		if can_shoot:
			shoot_bullets(detected_enemies[0].global_position)
	else:
		rotation_degrees = 0

func _physics_process(_delta: float) -> void:
	detected_enemies.sort_custom(
		func(enemyA,enemyB):
			return enemyA.global_position.distance_to(shoot_pos.global_position) < \
			enemyB.global_position.distance_to(shoot_pos.global_position))

func shoot_bullets(targetPos: Vector2):
	if source == 1:
		Controller.play_audio(audio_stream_player)
	can_shoot = false
	timer.start()
	var new_bullet = BULLET_SCENE.instantiate()
	new_bullet.set_bullet(source, bullet_speed, bullet_texture, exp_texture, bullet_damage, explosion_range, explosion_dmg,
		throughpass_count, ricochet_count, split_count, K_ACCURACY, K_CRIT_RATE, 
		shoot_pos.global_position, (targetPos - shoot_pos.global_position).normalized())
	Controller.battle_field.add_child(new_bullet)

func _on_timer_timeout() -> void:
	can_shoot = true

func _on_area_entered(area: Area2D) -> void:
	if source > 0 and area.is_in_group("enemies"):
		detected_enemies.append(area)
	elif source < 0 and area.is_in_group("allies"):
		detected_enemies.append(area)

func _on_area_exited(area: Area2D) -> void:
	detected_enemies.erase(area)

func _on_body_entered(body: Node2D) -> void:
	if source == -1 and body.is_in_group("player"):
		detected_enemies.append(body)
		
func _on_body_exited(body: Node2D) -> void:
	detected_enemies.erase(body)
