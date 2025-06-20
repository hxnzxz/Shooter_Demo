extends LevelParent


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionScene.change_scene("res://scenes/levels/inside.tscn")
#	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")


func _on_house_player_entered_house() -> void:
	var tween = get_tree().create_tween()
#	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1.5)
#	tween.tween_property($Player, "modulate:a", 0, 2)


func _on_house_player_left_house() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.5,0.5), 1)
