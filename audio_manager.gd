extends Node



func play_sound(stream: AudioStream, pitch_scale: float):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.finished.connect(remove_node.bind(instance))
	add_child(instance)
	instance.pitch_scale = pitch_scale
	instance.play()

func remove_node(instance : AudioStreamPlayer):
	instance.queue_free()
