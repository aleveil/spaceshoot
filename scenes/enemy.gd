extends Area2D

enum EnemyType {BLUE, ORANGE, RED, GREEN}

@export var type : EnemyType
@export var health = 10
@export var sprite : Sprite2D

func _ready():
	sprite.region_rect.position.x = type * 16
