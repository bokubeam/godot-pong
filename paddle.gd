extends CharacterBody2D


const MOVE_SPEED = 10.0
var move: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("player_1_move_down"):
		move = Vector2(0.0, MOVE_SPEED)
	elif Input.is_action_pressed("player_1_move_up"):
		move = Vector2(0.0, -MOVE_SPEED)
	else:
		move = Vector2.ZERO
		
	move_and_collide(move)
