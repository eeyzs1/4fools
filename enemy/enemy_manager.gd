extends Node2D

@onready var enemy_scene = preload("res://enemy/enemy.tscn")
@onready var alien_scene = preload("res://enemy/alien.tscn")
@onready var planet_scene = preload("res://enemy/planet.tscn")

@export var enemy_gen_amt_et = 2
@export var enemy_name_list = []

func set_enemy_multiplier(val):
	enemy_gen_amt_et = val * Setting.enemy_gen_amt_et

func set_enemy_name_list(val:Array):
	enemy_name_list = val

func start_enemy_spawn_timer(time: float) -> void:
	if enemy_name_list.size() > 0:
		$Timer.set_wait_time(time)
		$Timer.start()

func stop_enemy_spawn_timer() -> void:
	$Timer.stop()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_name = enemy_name_list.pick_random()
	if self.get_children().size() < Setting.max_enemy_amt + 1:
		for i in range(enemy_gen_amt_et):
			match NpcSettings.enemy[enemy_name]["type"]:
				"enemy":
					var enemy = enemy_scene.instantiate()
					# Set the enemy's position to a random location.
					enemy.global_position = Vector2(randi_range(Controller.window_size_x_min, Controller.window_size_x_max), \
						randi_range(Controller.window_size_y_min, Controller.window_size_y_max))
					enemy.init(enemy_name)
					# Spawn the enemy by adding it to the Main scene.
					add_child(enemy)
				"alien":
					var alien = alien_scene.instantiate()
					# Set the alien's position to a random location.
					alien.global_position = Vector2(randi_range(Controller.window_size_x_min, Controller.window_size_x_max), \
						randi_range(Controller.window_size_y_min, Controller.window_size_y_max))
					alien.init(enemy_name)
					# Spawn the alien by adding it to the Main scene.
					add_child(alien)
				"planet":
					var planet = planet_scene.instantiate()
					# Set the planet's position to a random location.
					planet.global_position = Vector2(randi_range(Controller.window_size_x_min, Controller.window_size_x_max), \
						randi_range(Controller.window_size_y_min, Controller.window_size_y_max))
					planet.init(enemy_name)
					# Spawn the planet by adding it to the Main scene.
					add_child(planet)
