extends Node2D

@export var particle: CPUParticles2D

func _ready():
	particle.emitting = true
func _on_cpu_particles_2d_finished():
	queue_free()
