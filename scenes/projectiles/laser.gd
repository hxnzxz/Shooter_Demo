extends Area2D

@export var speed: int = 1000
var direction:Vector2 = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LaserDuration.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if "hit" in body:
		body.hit()
	$Sprite2D.hide()
	await $AudioStreamPlayer2D.finished
	queue_free()


func _on_laser_duration_timeout() -> void:
	queue_free()
