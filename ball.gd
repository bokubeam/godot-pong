extends CharacterBody2D

signal player_1_scored
signal player_2_scored

func _ready()->void:
	ready_ball()
	
var startpos : Vector2
var speed_vel :Vector2 = Vector2(-10,5)
func ready_ball():
	position =  $"../Camera2D".get_screen_center_position()
	await get_tree().create_timer(0.2).timeout
	speed_vel += Vector2(randf_range(0,1),randf_range(0,1))
	
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
	print(body)
	player_2_scored.emit()
	ready_ball()

func _on_right_wall_body_entered(body: Node2D) -> void:
	print(body)
	player_1_scored.emit()
	ready_ball()
