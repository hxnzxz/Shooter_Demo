extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#input stuff
	var direction :Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#shoot laser
	if Input.is_action_pressed("primary action"):
		$"../Logo".pos.y += 4
		print("shot	")
	if Input.is_action_pressed("secondary action"):
		print("grenade")
