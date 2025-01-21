extends Label

var player_2_score = 0

func _on_duck_player_2_scored() -> void:
	player_2_score += 1
	text = str(player_2_score)
