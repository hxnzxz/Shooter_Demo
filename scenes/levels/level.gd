extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body) -> void:
	print("player entered level gate")
	print(body)


func _on_player_grenade_shot(pos) -> void:
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)


func _on_player_laser_shot(pos) -> void:
	
	var laser = laser_scene.instantiate()
	laser.position = pos
	
	$Projectiles.add_child(laser)
	# TODO
	# update laser location
	# give laser velocity
	# add laser instance to node2d
