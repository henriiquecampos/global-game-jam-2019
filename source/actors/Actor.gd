extends KinematicBody2D
const FLOOR_NORMAL = Vector2(0, -1)

export (float) var GRAVITY = 800.0
export (float) var FALL_SPEED = 200.0
export (float) var speed = 400.0
export (float) var dash_length = 600.0
export (float) var dash_multiplier = 3.0

var _velocity = Vector2(0, 0)
var _is_dashing = false
var _dash_start = Vector2(0, 0)
var _snap_velocity = Vector2(0, 0)

func _physics_process(delta):
	if _is_dashing:
		_velocity.y = 0
		if abs(_dash_start.x - position.x) >= dash_length:
			_velocity.x = speed * sign(_velocity.x)
			_is_dashing = false
			$Tween.stretch($Polygon2D, Vector2(1.0, 1.0), $Polygon2D.scale)
	else:
		_velocity.y += GRAVITY * delta

	if is_on_floor():
		_velocity.y = 0
		
	if is_on_wall():
		_velocity.x = 0

	move_and_slide(_velocity, FLOOR_NORMAL)

func _on_Area2D_body_entered(body):
	if _velocity.y > 0 and body.is_in_group("floor"):
		$Bounce.play()
		$Tween.squash($Polygon2D, Vector2(1.25, 0.75), $Polygon2D.scale)

func _unhandled_input(event):
	if event.is_action_pressed("left"):
		_velocity.x = -speed
		_velocity.x = min(0, -speed)
	elif event.is_action_released("left") and _velocity.x < 0:
		_velocity.x = 0.0
	elif event.is_action_pressed("right"):
		_velocity.x = speed
		_velocity.x = max(0, speed)
	elif event.is_action_released("right") and _velocity.x > 0:
		_velocity.x = 0.0
	
	if event.is_action_pressed("dash"):
		$Dash.play()
		_is_dashing = true
		_dash_start = position
		$Tween.stretch($Polygon2D, Vector2(1.25, 0.75), $Polygon2D.scale)
		_velocity.x = dash_multiplier * speed * sign(_velocity.x)
		
	if event.is_action_released("dash"):
		_velocity.x = speed * sign(_velocity.x)
		_is_dashing = false
		$Tween.stretch($Polygon2D, Vector2(1.0, 1.0), $Polygon2D.scale)