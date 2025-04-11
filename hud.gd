extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func _on_message_timer_timeout() -> void:
	$Message.hide()

func show_game_over(game_over_message):
	show_message(game_over_message)
	await $MessageTimer.timeout
	$Message.text = "Esquiva els cotxes"
	$Message.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed() -> void:
	start_game.emit()
	$StartButton.hide()
