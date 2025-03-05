extends Marker2D

var velocity = Vector2.ZERO
var gravity = Vector2.ZERO
var mass = 100
var modulate_time :int = 3
var scale_up_time :int = 1
var scale_down_time :int = 2

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color(0,0,0,0), modulate_time)
	tween.tween_property(self, "scale", Vector2(2,2), scale_up_time)
	tween.tween_property(self, "scale", Vector2(0.4, 0.4), scale_down_time)
	tween.tween_callback(self.queue_free)

func _process(delta: float) -> void:
	velocity += gravity * mass * delta
	global_position += velocity * delta

func set_text(txt):
	$text.text = txt
	
