extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var alternate: bool = true
signal laser(pos, direc)

var health: int = 50
var invulnerable: bool = false
func hit():
	if not invulnerable:
		health -= 10
		invulnerable = true
		$Timers/InvulnerableFrame.start()
		$Sprite2D.material.set_shader_parameter("progress", 1)
	if health <= 0:
		queue_free()
	print("scout hit")

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_position) 
		if can_laser:
			var pos: Vector2 = $LaserSpawnPositions.get_child(alternate).global_position
			var direction: Vector2 = (Globals.player_position - position).normalized()
			alternate = not alternate
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserCooldown.start()

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true


func _on_invulnerable_frame_timeout() -> void:
	invulnerable = false
	$Sprite2D.material.set_shader_parameter("progress", 0)
