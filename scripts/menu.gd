extends Control
class_name menu

func _ready():
	$VBoxContainer/Start.grab_focus()
	

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_options_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
