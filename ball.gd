extends CharacterBody2D

func _ready()->void:
	ready_ball()
	
var startpos : Vector2
var speed_vel :Vector2 = Vector2(-10,5)
func ready_ball():
	startpos =  $"../Camera2D".get_screen_center_position()
	await get_tree().create_timer(0.2).timeout
	speed_vel += Vector2(randf_range(0,1),randf_range(0,1))
	
func _physics_process(delta: float) -> void:
	velocity = speed_vel
	var collision_info = move_and_collide(speed_vel)
	if collision_info: 
		speed_vel = speed_vel.bounce(collision_info.get_normal())
