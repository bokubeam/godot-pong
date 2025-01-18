extends Label

var player_1_score = 0

func _on_ball_player_1_scored() -> void:
	player_1_score += 1
	text = str(player_1_score)
