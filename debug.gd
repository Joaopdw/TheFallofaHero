extends Node

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_pressed():
		var key: int = event
