extends LevelParent


func _on_exit_gate_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionScene.change_scene("res://scenes/levels/outside.tscn")
#	get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
 
