extends CharacterBody2D

signal shoot_bullet(bullet_scene, pos)

@export var bullet_scene : PackedScene
@export var sprite : Sprite2D
@export var shooting_point : Marker2D
const SPEED = 100
var last_shoot_timestamp = 0
var shoot_cooldown = 250
enum ShipType {BLUE = 0, ORANGE = 16, RED = 32, WHITE = 48}

func _ready():
	var rand_offset_ship = ShipType[ShipType.keys()[randi() % ShipType.size()]]
	sprite.region_rect.position.x = rand_offset_ship

func _physics_process(_delta):
	var direction := Input.get_axis("move_up", "move_down")
	
	velocity.y = direction * SPEED
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("shoot") \
	and Time.get_ticks_msec() > last_shoot_timestamp + shoot_cooldown:
		shoot()

func shoot():
	shoot_bullet.emit(bullet_scene, shooting_point.global_position)
	last_shoot_timestamp = Time.get_ticks_msec()
