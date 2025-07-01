extends CharacterBody2D

var active: bool = false
var vulnerable: bool = true
var explosion_active: bool = false

var speed: int = 0
var max_speed: int = 600
var health: int = 50
var speed_multiplier: int = 1

const blast_radius: int = 400

func _ready():
	$Explosion.hide()
	$Sprite2D.show()

func _process(delta: float) -> void:
	if active:
		var direction = (Globals.player_position - position).normalized()
		look_at(Globals.player_position)
		velocity = direction * speed * speed_multiplier
		var collided = move_and_collide(velocity * delta)
		if collided:
			explosion_active = true
			$AnimationPlayer.play("explosion")
		if explosion_active:
			for entity in get_tree().get_nodes_in_group("Entity") + \
				get_tree().get_nodes_in_group("Container"):
					if global_position.distance_to(entity.global_position) <= blast_radius :
						if "hit" in entity:
							entity.hit()

func stop_movement():
	speed_multiplier = 0

func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$Sprite2D.material.set_shader_parameter("progress", 1)
		$Sounds/HitSound.play()
		$HitTimer.start()
	if health <= 0:
		explosion_active = true
		$AnimationPlayer.play("explosion")

func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "speed", max_speed, 5)

func _on_hit_timer_timeout() -> void:
	vulnerable = true
	$Sprite2D.material.set_shader_parameter("progress", 0)
