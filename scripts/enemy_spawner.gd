extends Node

@export var enemy_container : Node
@export var enemy_scene : PackedScene

@export var top_marker : Marker2D
@export var bottom_marker : Marker2D

var enemy_spawn_cooldown := 1000
var last_enemy_spawn_timestamp := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Time.get_ticks_msec() > last_enemy_spawn_timestamp + enemy_spawn_cooldown):
		last_enemy_spawn_timestamp = Time.get_ticks_msec()
		spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	var randY = randf_range(top_marker.global_position.y, bottom_marker.global_position.y)
	enemy.global_position = Vector2(top_marker.global_position.x, randY)
	
	enemy.type = randi_range(0, 3)
	
	enemy_container.add_child(enemy)
