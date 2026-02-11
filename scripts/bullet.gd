extends Area2D

@export var speed := 600.0
var direction := Vector2.ZERO

func _process(delta: float) -> void:
	position += direction * speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_body_entered(body):
	if body.is_in_group("enemy"):
		var player = get_tree().get_first_node_in_group("player")
		if player:
			player.add_score(1)

		body.queue_free()
		queue_free()
