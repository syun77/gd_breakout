extends StaticBody2D

class_name Block

enum eMyColor {
	RED,
	ORANGE,
	YELLOW,
	GREEN,
	BLUE,
}

const COLOR_TBL = {
	eMyColor.RED: Color.TOMATO,
	eMyColor.ORANGE: Color.ORANGE,
	eMyColor.YELLOW: Color.YELLOW,
	eMyColor.GREEN: Color.PALE_GREEN,
	eMyColor.BLUE: Color.SKY_BLUE,
}

@export var color = eMyColor.RED
@onready var _color_rect = $ColorRect

func _get_color() -> Color:
	var c = COLOR_TBL[color]
	return c

func _physics_process(delta: float) -> void:
	_color_rect.color = _get_color()
