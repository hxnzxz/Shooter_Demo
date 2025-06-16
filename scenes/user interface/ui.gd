extends CanvasLayer

@onready var laser_value:Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_value: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon:TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon:TextureRect = $GrenadeCounter/VBoxContainer/TextureRect


var green: Color = Color(0, 1, 0, 1)
var red: Color = Color(1, 0, 0, 1)

func _ready():
	update_grenade_text()
	update_laser_text()

func update_laser_text():
	laser_value.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_value, laser_icon)

func update_grenade_text():
	grenade_value.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_value, grenade_icon)


func update_color(amount:int, label:Label, icon:TextureRect) -> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
