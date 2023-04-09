extends CharacterBody2D

const INIT_SPEED = 300
const SPEEDUP = 2
const MAX_SPEED = 500

@onready var _spr = $Sprite

var _rot_speed = 0.0

func _ready() -> void:
	velocity.x = 1
	velocity.y = 0.5
	velocity = velocity.normalized()
	velocity *= INIT_SPEED

func _physics_process(delta: float) -> void:
	
	_spr.rotation += _rot_speed * delta
	
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var body = collision_info.get_collider()
		if body is Block:
			body.queue_free()
		#emit_signal("got_brick", body.get_score())
		# 衝突反転する.
		# 衝突方向.
		var normal = collision_info.get_normal()
		var angle = normal.angle()
		_rot_speed = angle * 10
		
		velocity = velocity.bounce(normal)
		
		# 加速する.
		var speed = velocity.length() + SPEEDUP
		if speed > MAX_SPEED:
			speed = MAX_SPEED
		velocity = velocity.normalized() * speed
