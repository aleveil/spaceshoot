extends Area2D

const SPEED := 300

func _process(delta):
	global_position.x += SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("delete bullet")
	queue_free()
