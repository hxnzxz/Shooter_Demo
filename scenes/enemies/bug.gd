extends CharacterBody2D

var health: int = 20
var active: bool = false
var speed: int = 300
var vulnerable: bool = true
var player_near: bool = false

func _process(_delta):
	var direction = (Globals.player_position - position).normalized()
	velocity = direction * speed 
	if active:
		look_at(Globals.player_position)
		move_and_slide()

func hit():
	if vulnerable:
		health -= 10
		$AudioStreamPlayer2D.play()
		vulnerable = false
		$Timers/HitTimer.start()
		$AnimatedSprite2D.material.set_shader_parameter("progress", 1)
		print("bug lost hp")
		$Particles/HitParticles.emitting = true
	#	$Sprite2D.material.set_shader_parameter("progress", 1)
	if health <= 0:
		await get_tree().create_timer(0.5).timeout
		queue_free()


func _on_attack_hit_box_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimatedSprite2D.play("attack")

func _on_attack_hit_box_body_exited(_body: Node2D) -> void:
	player_near = false

func _on_notice_range_body_entered(_body: Node2D) -> void:
	active = true
	$AnimatedSprite2D.play("move")

func _on_notice_range_body_exited(_body: Node2D) -> void:
	active = false
	$AnimatedSprite2D.stop()

func _on_animated_sprite_2d_animation_finished() -> void:
	if player_near:
		Globals.health -= 10
		$Timers/AttackTimer.start()

func _on_attack_timer_timeout() -> void:
	$AnimatedSprite2D.play("attack")

func _on_hit_timer_timeout() -> void:
	vulnerable = true
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)
