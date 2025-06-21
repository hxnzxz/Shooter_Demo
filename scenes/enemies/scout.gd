extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var alternate: bool = true
signal laser(pos, direc)

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_position) 
		if can_laser:
			var pos: Vector2 = $LaserSpawnPositions.get_child(alternate).global_position
			var direction: Vector2 = (Globals.player_position - position).normalized()
			alternate = not alternate
			laser.emit(pos, direction)
			can_laser = false
			$LaserCooldown.start()

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true
	pass # Replace with function body.


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false
	pass # Replace with function body.


func _on_laser_cooldown_timeout() -> void:
	can_laser = true
