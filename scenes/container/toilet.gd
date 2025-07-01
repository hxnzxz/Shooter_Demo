extends ItemContainer


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func hit():
	if not opened:
		$LidSprite.hide()
		$HitSound.play()
		var pos_node = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count())
		var pos = pos_node.global_position
		open.emit(pos, cur_direction)
		opened = true
