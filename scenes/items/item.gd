extends Area2D

var rotation_speed: int = 5
var available_types = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_types[randi() % len(available_types)]

var direction: Vector2
var distance: int = randi_range(150, 250)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.2, 0.9)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.9, 0.1, 0.2)
	if type == 'health':
		$Sprite2D.modulate = Color(0.2, 0.9, 0.1)
	# tween animate position and size
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale",Vector2(1,1), 0.3).from(Vector2(0,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	if type == 'health':
		Globals.health += 10
	if type == 'grenade':
		Globals.grenade_amount += 1
	if type == 'laser':
		Globals.laser_amount += 5
	$Sprite2D.hide()
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
	queue_free()
