extends LevelParent


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionScene.change_scene("res://scenes/levels/inside.tscn")
#	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
