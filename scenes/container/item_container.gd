extends StaticBody2D
class_name ItemContainer

@onready var cur_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal open(pos, direction)
var opened:bool = false
func hit():
	$LidSprite.hide()
