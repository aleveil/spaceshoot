extends Area2D

const SPEED := 30
var type := 0
var hit_shader_duration := 80
var last_hit_time := 0

@export var health = 10
@export var sprite : Sprite2D
@export var effect_on_death : PackedScene
@export var explode_sfx : AudioStream
@export var hit_sfx : AudioStream

func _ready():
	sprite.region_rect.position = Vector2(type * 16, 16)
	
func _process(delta):
	if sprite.region_rect.position.y != 16:
		print(name, sprite.region_rect.position.y)
	global_position.x += -SPEED * delta
	if Time.get_ticks_msec() > hit_shader_duration + last_hit_time:
		sprite.material.set_shader_parameter("isEnable", false);

func take_damage(damage):
	health -= damage
	last_hit_time = Time.get_ticks_msec()
	sprite.material.set_shader_parameter("isEnable", true)
	AudioManager.play_sound(hit_sfx, randf_range(0.6, 1.2))
	if health <= 0:
		die()

func die():
	var effect = effect_on_death.instantiate()
	effect.global_position = global_position
	get_parent().add_child(effect)
	AudioManager.play_sound(explode_sfx, randf_range(0.6, 1.2))
	queue_free()
