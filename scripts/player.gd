extends CharacterBody2D


@export var speed := 250.0
@export var bullet_scene: PackedScene
@export var bullet_spawn_offset := 40.0
@export var fire_rate := 0.2   # seconds between shots

var fire_timer := 0.0

var score := 0
var is_dead := false

func _physics_process(delta: float) -> void:	
	
	fire_timer -= delta
	
	if Input.is_action_pressed("shoot") and fire_timer <= 0:
		shoot()
		fire_timer = fire_rate
	
	look_at(get_global_mouse_position())
	
	var direction := Vector2.ZERO
	
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
	
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
	
	GameManager.game_over()

func add_score(amount := 1):
	GameManager.score += amount
