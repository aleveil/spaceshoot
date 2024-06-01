extends Area2D

@export var sprite: Sprite2D

const SPEED := 300

var damage: int
var type: int
var color: int
var velocity : Vector2
var spread: int

func _ready():
	type = 0
	color = randi() % 4
	sprite.region_rect.position.x = type * 8
	sprite.region_rect.position.y = color * 8
	
	spread = 20
	
	velocity = Vector2(SPEED, randf_range(-spread, spread))

func _process(delta):
	global_position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if (area.is_in_group("enemy")):
		area.take_damage(damage)
		queue_free()
