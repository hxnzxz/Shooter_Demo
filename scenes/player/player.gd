extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser_shot(pos, direction)
signal grenade_shot(pos, direction)
@export var max_speed: int = 500
var speed: int = max_speed
# Called when the node enters the scene tree for the first time.

func hit():
	Globals.health -= 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#input stuff
	var direction :Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_position = global_position
	#rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#shoot laser
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		Globals.laser_amount -= 1
		$LaserTimer.start()
		can_laser = false
		laser_shot.emit(selected_laser.global_position, player_direction)
		$GPUParticles2D.emitting = true
		
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		var selected_grenade = $GrenadeStartPositions.get_children()[0]
		Globals.grenade_amount -= 1
		$GrenadeTimer.start()
		can_grenade = false
		grenade_shot.emit(selected_grenade.global_position, player_direction)




func _on_grenade_timer_timeout() -> void:
	can_grenade = true


func _on_laser_timer_timeout() -> void:
	can_laser = true
