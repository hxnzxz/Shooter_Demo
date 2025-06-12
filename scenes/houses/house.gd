extends Area2D

signal player_entered_house
signal player_left_house



func _on_body_entered(_body: Node2D) -> void:
	player_entered_house.emit()


func _on_body_exited(_body: Node2D) -> void:
	player_left_house.emit()
