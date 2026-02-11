extends Node

var is_game_over = false

var score := 0
var high_score := 0

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS  # Godot 4

func game_over():
	if is_game_over:
		return
	
	is_game_over = true
	get_tree().paused = true
	print("Game Over")
	
	if score > high_score:
		high_score = score

func _process(delta: float) -> void:
	if is_game_over and Input.is_action_just_pressed("restart"):
		restart()

func restart():
	is_game_over = false
	score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
