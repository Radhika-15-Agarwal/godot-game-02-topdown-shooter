extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_rate := 2.0
@export var difficulty_increase_rate := 0.02

var timer := 0.0

func _process(delta: float) -> void:
	timer += delta
	if timer > spawn_rate:
		spawn_enemy()
		timer = 0.0
	spawn_rate = max(0.5, spawn_rate - difficulty_increase_rate * delta)

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	get_tree().current_scene.add_child(enemy)

	var screen_size = get_viewport_rect().size

	enemy.position = Vector2(randf_range(0, screen_size.x), -40)
