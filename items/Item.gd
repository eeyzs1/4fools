class_name Item
extends Area2D

@onready var can_move:bool = false
@onready var K_SPEED:int = 200
@onready var img: TextureRect = $img

var key = "bounty"
var val:int = 1
var target
var texture
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	img.texture = load(texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move:
		var target_direction = (target.global_position - self.global_position).normalized()
		position += target_direction * K_SPEED * delta
		rotation = target_direction.angle()

func move_to_target(targetArea) -> void:
	can_move = true
	target = targetArea

func _on_body_entered(body) -> void:
	body.collect_item(key, val)
	queue_free() 
