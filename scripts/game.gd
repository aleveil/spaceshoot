extends Node2D

@export var player : CharacterBody2D
@export var bullet_container : Node
@export var audio_player : AudioStreamPlayer

func _ready():
	player.shoot_bullet.connect(_on_player_shoot_bullet)

func _on_player_shoot_bullet(bullet_scene, pos):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = pos
	bullet_container.add_child(bullet)
	audio_player.pitch_scale = randf_range(0.6, 1.2)
	audio_player.play()
