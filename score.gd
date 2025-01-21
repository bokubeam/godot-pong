extends Label

enum Player {ONE, TWO}
@export var player: Player

var score = 0

func _on_duck_player_2_scored() -> void:
	print("p2 score")
	if player == Player.TWO:
		score += 1
		text = str(score)
		$ScoreSound.play()

func _on_duck_player_1_scored() -> void:
	print("p1 score")
	if player == Player.ONE:
		score += 1
		text = str(score)
		$ScoreSound.play()
