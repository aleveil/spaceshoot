extends CharacterBody2D

@export var bullet_scene : PackedScene
@export var sprite : Sprite2D
@export var shooting_point : Marker2D
@export var sfx_shoot : AudioStream

const SPEED := 100
var type := 0
var shoot_power := 2

var last_shoot_timestamp := 0
var shoot_cooldown := 100

func _ready():
	sprite.region_rect.position.x = type * 16

func _physics_process(_delta):
	var direction := Input.get_axis("move_up", "move_down")
	
	velocity.y = direction * SPEED
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("shoot") \
	and Time.get_ticks_msec() > last_shoot_timestamp + shoot_cooldown:
		shoot()

func shoot():
	last_shoot_timestamp = Time.get_ticks_msec()
	var bullet = bullet_scene.instantiate()
	bullet.global_position = shooting_point.global_position
	bullet.damage = shoot_power
	get_parent().add_child(bullet)
	AudioManager.play_sound(sfx_shoot, randf_range(0.6, 1.2))
