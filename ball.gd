extends CharacterBody2D

signal player_1_scored
signal player_2_scored

var startpos: Vector2
var speed_vel: Vector2 = Vector2(0, 0)
var ball_speed = 20.0

func _ready()->void:
	ready_ball()

func ready_ball():
	position =  $"../Camera2D".get_screen_center_position()
	speed_vel = Vector2.ZERO
	await get_tree().create_timer(0.2).timeout
	var random_angle = randf_range(315, 405)
	speed_vel = Vector2.from_angle(deg_to_rad(random_angle)) * ball_speed
	
func _physics_process(delta: float) -> void:
	velocity = speed_vel
	var collision_info = move_and_collide(speed_vel)
	if collision_info: 
		speed_vel = speed_vel.bounce(collision_info.get_normal())

# Collision layers and masks need to be set for all
# collision objects.
# Collision layers are the categories of the object they are
# defined on. Collision masks define what the object can
# collide with.
func _on_left_wall_body_entered(body: Node2D) -> void:
	player_2_scored.emit()
	ready_ball()

func _on_right_wall_body_entered(body: Node2D) -> void:
	player_1_scored.emit()
	ready_ball()
