class_name Hurtbox
extends Area2D

signal hurt(damage)

func _on_hurtbox_hurt(damage) -> void:
	owner.take_damage(damage)
