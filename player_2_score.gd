extends Label

var player_2_score = 0

func _on_ball_player_2_scored() -> void:
	player_2_score += 1
	text = "weee"
	
