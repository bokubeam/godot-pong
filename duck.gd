extends CharacterBody2D

signal player_1_scored
signal player_2_scored

var startpos: Vector2
var speed = 20.0
var random_angle
const SPEED_INCREASE_RATIO = 1.001

func _ready()->void:
	var x = 180 if randi() % 2 == 0 else 0
	reset(randf_range(315, 405) - x)

func reset(angle: float):
	position =  $"../Camera2D".get_screen_center_position()
	velocity = Vector2.ZERO
	await get_tree().create_timer(0.2).timeout
	velocity = Vector2.from_angle(deg_to_rad(angle)) * speed

func _process(delta: float) -> void:
	var angle = velocity.angle()
	if angle < PI / 2 && angle > -PI / 2:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true

func _physics_process(delta: float) -> void:
	velocity = velocity * SPEED_INCREASE_RATIO
	var collision_info = move_and_collide(velocity)
	if collision_info:
		$Quack.pitch_scale = randf_range(0.9, 1.1)
		$Quack.play()
		velocity = velocity.bounce(collision_info.get_normal())

# Collision layers and masks need to be set for all
# collision objects.
# Collision layers are the categories of the object they are
# defined on. Collision masks define what the object can
# collide with.

func _on_left_goal_body_entered(body: Node2D) -> void:
	player_2_scored.emit()
	reset(randf_range(315, 405))

func _on_right_goal_body_entered(body: Node2D) -> void:
	player_1_scored.emit()
	reset(randf_range(135, 225))
