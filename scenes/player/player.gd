extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser_shot(pos, direction)
signal grenade_shot(pos, direction)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#input stuff
	var direction :Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#shoot laser
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		$LaserTimer.start()
		can_laser = false
		laser_shot.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var selected_grenade = $GrenadeStartPositions.get_children()[0]
		$GrenadeTimer.start()
		can_grenade = false
		grenade_shot.emit(selected_grenade.global_position, player_direction)




func _on_grenade_timer_timeout() -> void:
	can_grenade = true
	pass # Replace with function body.


func _on_laser_timer_timeout() -> void:
	can_laser = true
	pass # Replace with function body.
