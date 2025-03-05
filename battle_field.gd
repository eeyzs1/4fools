extends Node

@onready var map: TextureRect = $Map

func _ready():
	map.hide()

func hide():
	map.hide()

func show():
	map.show()

func set_map(path):
	map.texture = load(path)
