extends CharacterBody2D


func _process(_delta: float) -> void:
	var direction = Vector2(1,0)
	velocity = direction * 200
	move_and_slide()

func hit():
	print("hit")
