class_name PickUpArea
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_entered(item: Item) -> void:
	item.move_to_target(self) 
