extends RigidBody2D

const speed: int = 750
const blast_radius: int = 350
var explosion_active: bool = false

func explode() -> void:
	$AnimationPlayer.play("Explosion")
	explosion_active = true
			

func _process(delta) -> void:
	if explosion_active:
		for entity in get_tree().get_nodes_in_group("Entity") + \
			get_tree().get_nodes_in_group("Container"):
				if global_position.distance_to(entity.global_position) <= blast_radius :
					if "hit" in entity:
						entity.hit()
