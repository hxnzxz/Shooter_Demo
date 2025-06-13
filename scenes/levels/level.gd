extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")


func _on_player_grenade_shot(pos, direction) -> void:
	var grenade : RigidBody2D = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_player_laser_shot(pos, direction) -> void:
	var laser : Area2D	 = laser_scene.instantiate()
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)



func _on_house_player_entered_house() -> void:
	var tween = get_tree().create_tween()
#	tween.set_parallel(true)
#	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1.5)
	tween.tween_property($Player, "modulate:a", 0, 2)


func _on_house_player_left_house() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.5,0.5), 1)
