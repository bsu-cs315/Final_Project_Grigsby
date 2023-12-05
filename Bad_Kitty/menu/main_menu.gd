extends Control

func _process(_delta):
	var tween = get_tree().create_tween()
	tween.tween_property($Label, "position", Vector2(365,144), 1)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://world/world.tscn")


func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://menu/controls_menu.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://menu/credits.tscn")
