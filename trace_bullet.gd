class_name Bullet
extends Area2D

@export var bullet_speed :int = 0
@export var bullet_direction = Vector2.ZERO
@export var bullet_destroy_when_hit:bool = true
@onready var img: TextureRect = $Img

var bullet_damage = 0
var trace_num = 0
var source = 0
var bullet_texture
var target
var count_num

func _ready():
	img.texture = bullet_texture
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var speed = 0
	if Controller.bullet_slow_down and source != 1:
		speed = bullet_speed * delta
	else:
		speed = bullet_speed
	if count_num > 0:
		count_num -= 1
	else:
		if trace_num > 0:
			bullet_direction = self.global_position.direction_to(target.global_position)
			global_rotation = bullet_direction.angle()
			global_position += bullet_direction * speed * delta
			trace_num -= 1
		else:
			global_position += bullet_direction * speed * delta

func set_bullet(source_i,bullet_speed_i, bullet_texture_i, bullet_damage_i, 
	trace_num_i, target_i, global_position_i, bullet_direction_i, num_i):
	source = source_i
	bullet_speed = bullet_speed_i
	bullet_damage = bullet_damage_i
	trace_num = trace_num_i
	target = target_i
	bullet_texture = bullet_texture_i
	global_position = global_position_i
	bullet_direction = bullet_direction_i
	global_rotation = bullet_direction.angle()
	global_position += bullet_direction * bullet_speed / 5
	count_num = num_i

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("walls"):
		queue_free()
	elif (source == -1 and body.is_in_group("player")):
		body.take_damage(bullet_damage)
		queue_free()
	else:
		pass

func _on_area_entered(area: Area2D) -> void:
	if (source > 0 and area.is_in_group("enemies")) or (source == -1 and area.is_in_group("allies")):
		area.take_damage(bullet_damage)
		queue_free()
