extends CharacterBody2D


@export var speed := 250.0
@export var bullet_scene: PackedScene
@export var bullet_spawn_offset := 40.0
@onready var score_label = get_tree().get_first_node_in_group("score_label")
@onready var game_over_label = get_tree().get_first_node_in_group("game_over_label")

var score := 0
var is_dead := false

func _physics_process(delta: float) -> void:	
	
	var direction := Vector2.ZERO
	
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		shoot()
		
func shoot():
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	
	var mouse_pos = get_global_mouse_position()
	bullet.direction = (mouse_pos - global_position).normalized()
	
	bullet.global_position = global_position + bullet.direction * bullet_spawn_offset
	
func die():
	if is_dead:
		return

	is_dead = true
	
	if game_over_label:
		game_over_label.visible = true
		
	GameManager.game_over()
		
func add_score(amount := 1):
		score += amount
		update_score_ui()

func update_score_ui():
	if score_label:
		score_label.text = "Score: %d" % score
