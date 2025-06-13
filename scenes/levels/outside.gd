extends LevelParent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
