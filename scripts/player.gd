extends CharacterBody2D

signal shoot_bullet(bullet_scene, pos)

var bullet_scene = preload("res://scenes/bullet.tscn")
const SPEED = 400
var last_shoot_timestamp = 0
var shoot_cooldown = 1000

func _physics_process(_delta):
	var direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("shoot") \
	and Time.get_ticks_msec() > last_shoot_timestamp + shoot_cooldown:
		shoot()

func shoot():
	shoot_bullet.emit(bullet_scene, global_position)
	last_shoot_timestamp = Time.get_ticks_msec()
