extends Control

var _is_paused: bool = false:
	set = set_paused

#the function below is used to handle an input related to a GUI Control item
#as far as I can understand
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused

func set_paused(value: bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_pressed() -> void:
	_is_paused = false
	get_tree().paused = _is_paused

func _on_quit_pressed() -> void:
	get_tree().quit()
