class_name audio_button
extends Button

func _ready():
	mouse_default_cursor_shape = CURSOR_POINTING_HAND

func _on_focus_entered():
	Controller.play_ui_focus_sound()
	release_focus()

func _on_button_down():
	Controller.play_ui_click_sound()


func _on_mouse_entered():
	Controller.play_ui_click_sound()
