extends ItemContainer

	
func hit():
	if not opened:
		$LidSprite.hide()
		$HitSound.play()
		for x in range(5):
			var pos_node = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count())
			var pos = pos_node.global_position
			open.emit(pos, cur_direction)
		opened = true
