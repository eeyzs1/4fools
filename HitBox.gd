class_name HitBox
extends Area2D

@onready var timer = $Timer
@export var damage = 1

var last_hurtbox
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#timer = find_child("Timer")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(hurtbox: Hurtbox) -> void:
	hurtbox.hurt.emit(damage)
	last_hurtbox = hurtbox
	timer.start()

func _on_timer_timeout() -> void:
	if has_overlapping_areas():
		last_hurtbox.hurt.emit(damage)
		timer.start()
	else:
		timer.stop()
