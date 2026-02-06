extends Area2D

@export var speed := 600.0
var direction := Vector2.ZERO

func _process(delta: float) -> void:
	position += direction * speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_body_entered(body):
	print("HIT:", body.name)
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()
