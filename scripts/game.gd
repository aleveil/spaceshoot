extends Node2D

@onready var player = $Player
@onready var bullet_container = $BulletContainer

func _ready():
	player.shoot_bullet.connect(_on_player_shoot_bullet)

func _on_player_shoot_bullet(bullet_scene, pos):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = pos
	bullet_container.add_child(bullet)
