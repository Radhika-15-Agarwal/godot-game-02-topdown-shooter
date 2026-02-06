extends CharacterBody2D


@export var speed := 250.0
@export var bullet_scene: PackedScene


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
	
	bullet.global_position = global_position
	
	var mouse_pos = get_global_mouse_position()
	bullet.direction = (mouse_pos - global_position).normalized()
