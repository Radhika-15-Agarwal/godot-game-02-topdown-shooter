extends Node

var is_game_over = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS  # Godot 4

func game_over():
	if is_game_over:
		return
	
	is_game_over = true
	get_tree().paused = true
	print("Game Over")

func _process(delta: float) -> void:
	if is_game_over and Input.is_action_just_pressed("ui_accept"):
		restart()

func restart():
	is_game_over = false
	get_tree().paused = false
	get_tree().reload_current_scene()
