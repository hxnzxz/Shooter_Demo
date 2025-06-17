extends Area2D

var rotation_speed: int = 5
var available_types = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_types[randi() % len(available_types)]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.2, 0.9)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.9, 0.1, 0.2)
	if type == 'health':
		$Sprite2D.modulate = Color(0.2, 0.9, 0.1)
	print(type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(body: Node2D) -> void:
	body.add_item(type)
	queue_free()
