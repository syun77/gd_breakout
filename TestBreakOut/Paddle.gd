extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var mouse = get_viewport().get_mouse_position()
	var dx = mouse.x - position.x
	velocity.x = dx * 3
	move_and_collide(velocity * delta)
