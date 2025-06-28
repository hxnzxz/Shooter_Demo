extends CharacterBody2D

var active: bool = false
var speed: int = 200

func _ready() -> void:
	$NavigationAgent2D.target_position = Globals.player_position

func _physics_process(_delta: float) -> void:
	if active:
		var next_path_position: Vector2 = $NavigationAgent2D.get_next_path_position()
		print($NavigationAgent2D.get_current_navigation_path())
		var direction: Vector2 = (next_path_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		look_at(Globals.player_position)


func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true


func _on_notice_area_body_exited(_body: Node2D) -> void:
	active = false


func _on_navigation_timer_timeout() -> void:
	if active:
		$NavigationAgent2D.target_position = Globals.player_position
