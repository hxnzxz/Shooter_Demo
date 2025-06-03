extends Node2D


func _on_gate_player_entered_gate(body) -> void:
	print("player entered level gate")
	print(body)


func _on_player_grenade_shot() -> void:
	print("grenade launched")


func _on_player_laser_shot() -> void:
	print("laser shot")
