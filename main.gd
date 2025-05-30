extends Node2D

var score

func _ready() -> void:
	pass


func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over("Game Over")
	
func game_won():
	$ScoreTimer.stop()
	$HUD.show_game_over("YOU WON!")

func new_game():
	score = 0
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get ready")


func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout() -> void:
	$ScoreTimer.start()
	$Player.start($StartPosition.position)
