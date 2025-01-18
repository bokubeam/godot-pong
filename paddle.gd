extends CharacterBody2D

enum Player {ONE, TWO}
@export var player: Player
var move_down: String
var move_up: String

const MOVE_SPEED = 20.0
var move: Vector2 = Vector2.ZERO

func _ready() -> void:
	match player:
		Player.ONE:
			move_down = "player_1_move_down"
			move_up = "player_1_move_up"
		Player.TWO:
			move_down = "player_2_move_down"
			move_up = "player_2_move_up"

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(move_down):
		move = Vector2(0.0, MOVE_SPEED)
	elif Input.is_action_pressed(move_up):
		move = Vector2(0.0, -MOVE_SPEED)
	else:
		move = Vector2.ZERO
		
	move_and_collide(move)
