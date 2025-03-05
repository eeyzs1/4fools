extends Area2D

@export var bullet_speed :int = 0
@export var bullet_direction = Vector2.ZERO
@export var bullet_destroy_when_hit:bool = true
@onready var explosion: CollisionShape2D = $ExplosionDetection/explosion
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var img: TextureRect = $Img

const FLOAT_TEXT = preload("res://float_text.tscn")
const BULLET_SCENE = preload("res://bullet.tscn")

var bullet_damage = 0
var explosion_range = 0
var explosion_dmg = 0
var throughpass_count = 0
var ricochet_count = 0
var split_count = 0
var K_CRIT_RATE = 0
var K_ACCURACY = 0
var source = 0
var detected_enemies = []
var bullet_texture
var exp_texture

func _ready():
	img.texture = bullet_texture
	if explosion_dmg > 0 and explosion_range > 0:
		explosion["shape"]["radius"] = explosion_range
		explosion_particles.texture = exp_texture
	else:
		explosion.disabled = true
		explosion_particles.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Controller.bullet_slow_down and source != 1:
		global_position += bullet_direction * bullet_speed * delta
	else:
		global_position += bullet_direction * bullet_speed

func set_bullet(source_i, bullet_speed_i, bullet_texture_i, exp_texture_i, bullet_damage_i, explosion_range_i, explosion_dmg_i,
		throughpass_count_i, ricochet_count_i, split_count_i, accuracy_i, crit_rate_i, global_position_i, bullet_direction_i):
	source = source_i
	bullet_speed = bullet_speed_i
	bullet_damage = bullet_damage_i
	explosion_range = explosion_range_i
	explosion_dmg = explosion_dmg_i
	throughpass_count = throughpass_count_i
	ricochet_count = ricochet_count_i
	split_count = split_count_i
	K_ACCURACY = accuracy_i
	K_CRIT_RATE = crit_rate_i
	exp_texture = exp_texture_i
	bullet_texture = bullet_texture_i
	global_position = global_position_i
	bullet_direction = bullet_direction_i
	global_rotation = bullet_direction.angle()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("walls"):
		queue_free()
	elif (source == -1 and body.is_in_group("player")):
		if randi_range(0, 100) > K_CRIT_RATE:
			body.take_damage(bullet_damage)
		else:
			body.take_damage(bullet_damage*2)
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if (source == -1 and area.is_in_group("allies")):
		if randi_range(0, 100) < K_ACCURACY:
			if randi_range(0, 100) > K_CRIT_RATE:
				area.take_damage(bullet_damage)
			else:
				area.take_damage(bullet_damage*2)
		else:
			if Setting.dmg_display:
				show_miss()
	elif source > 0:
		if randi_range(0, 100) < K_ACCURACY:
			if randi_range(0, 100) > K_CRIT_RATE:
				area.take_damage(bullet_damage)
			else:
				area.take_damage(bullet_damage*2)
		else:
			if Setting.dmg_display:
				show_miss()
		if explosion_dmg > 0 and explosion_range > 0:
			explosion_particles.emitting = true
			for x in detected_enemies:
				x.take_damage(explosion_dmg)
			detected_enemies = []
		if throughpass_count > 0:
			throughpass_count -= 1
		if split_count > 0:
			var rad = PI/split_count
			var bias = PI/2
			for i in range(0, split_count):
				split_count = 0
				var new_bullet = BULLET_SCENE.instantiate()
				var dir = bullet_direction.rotated(i * rad  - bias)
				new_bullet.set_bullet(source, bullet_speed,bullet_texture, exp_texture, bullet_damage, 0, 0,
					0, 0, 0, K_ACCURACY, K_CRIT_RATE, global_position, dir)
				call_deferred("add_new_bullet", new_bullet)
		if ricochet_count > 0:
			bullet_direction.rotated(randf_range(-PI/2, PI/2))
			ricochet_count -= 1
		if ricochet_count == 0 and throughpass_count == 0:
			queue_free()

func add_new_bullet(new_bullet):
	Controller.battle_field.add_child(new_bullet)

func show_miss():
	var ft = FLOAT_TEXT.instantiate()
	ft.set_text("MISS")
	ft.velocity = Vector2(randf_range(-50,50),-100)
	ft.gravity = Vector2(0,2)
	ft.mass = 100
	Controller.battle_field.add_child(ft)

func _on_explosion_detection_area_entered(area: Area2D) -> void:
	if source > 0 and area.is_in_group("enemies"):
		detected_enemies.append(area)
	elif source == -1 and area.is_in_group("allies"):
		detected_enemies.append(area)

func _on_explosion_detection_area_exited(area: Area2D) -> void:
	detected_enemies.erase(area)

func _on_explosion_detection_body_entered(body: Node2D) -> void:
	if source == -1 and (body.is_in_group("player")):
		detected_enemies.append(body)

func _on_explosion_detection_body_exited(body: Node2D) -> void:
	detected_enemies.erase(body)
