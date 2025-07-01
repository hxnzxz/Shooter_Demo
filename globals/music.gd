extends Node

var playing: bool = true

func _process(delta):
	if Input.is_action_just_pressed("mute BGM"):
		if playing:
			playing = false
			$AudioStreamPlayer.volume_db = -100
		else:
			playing = true
			$AudioStreamPlayer.volume_db = -5
