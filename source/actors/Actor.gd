extends KinematicBody2D
const FLOOR_NORMAL = Vector2(0, -1)

export (float) var GRAVITY = 800.0
export (float) var speed = 400.0
export (float) var max_speed = 400.0
export (float) var dash_length = 600.0
export (float) var dash_multiplier = 3.0

var _velocity = Vector2(0, 0)
var _is_dashing = false
var _dash_start = Vector2(0, 0)
var _snap_velocity = Vector2(0, 0)

var can_dash = true

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		_velocity.x += speed * delta
		_velocity.x = min(_velocity.x, max_speed)
	if Input.is_action_just_released("right") and _velocity.x > 0.0:
		_velocity.x = 0
	if Input.is_action_pressed("left"):
		_velocity.x += -speed * delta
		_velocity.x = max(_velocity.x, -max_speed)
	if Input.is_action_just_released("left") and _velocity.x < 0.0:
		_velocity.x = 0
	
	if Input.is_action_just_pressed("dash") and can_dash:
		_dash_start = position
		_is_dashing = true
	if Input.is_action_pressed("dash") and can_dash:
		_velocity.x = (dash_multiplier * speed * sign(_velocity.x))
		_velocity.x = min(abs(_velocity.x), 
				dash_multiplier * (max_speed * sign(_velocity.x)))
		_velocity.y = 0.0
	if Input.is_action_just_released("dash"):
		_velocity.x = min(abs(_velocity.x) * sign(_velocity.x),
				max_speed * sign(_velocity.x))
		_is_dashing = false
		if is_on_floor():
			can_dash = true
	
	if _is_dashing:
		if abs(_dash_start.x - position.x) >= dash_length:
			_velocity.x = min(abs(_velocity.x) * sign(_velocity.x),
					max_speed * sign(_velocity.x))
			_is_dashing = false
			can_dash = false
	
	if is_on_floor():
		_snap_velocity = get_floor_velocity()
	elif not _is_dashing:
		_velocity.y += GRAVITY * delta

	move_and_slide(_velocity, FLOOR_NORMAL)
