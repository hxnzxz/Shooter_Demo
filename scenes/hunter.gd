extends CharacterBody2D

var active: bool = false
var speed: int = 200
var player_near: bool = false
var vulnerable: bool = true
var health: int = 40
func _ready() -> void:
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 4.0
	$NavigationAgent2D.target_position = Globals.player_position

func _physics_process(_delta: float) -> void:
	if active:
		var next_path_position: Vector2 = $NavigationAgent2D.get_next_path_position()
		print($NavigationAgent2D.get_current_navigation_path())
		var direction: Vector2 = (next_path_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		var look_angle = direction.angle()
		rotation = look_angle + PI/2


func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true
	$AnimationPlayer.play("walk")


func _on_notice_area_body_exited(_body: Node2D) -> void:
	active = false


func _on_navigation_timer_timeout() -> void:
	if active:
		$NavigationAgent2D.target_position = Globals.player_position


func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimationPlayer.play("attack")

func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_near = false


func attack() -> void:
	if player_near:
		Globals.health -= 10

func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$Timers/HitTimer.start()
	if health <= 0:
		queue_free()


func _on_hit_timer_timeout() -> void:
	vulnerable = true
