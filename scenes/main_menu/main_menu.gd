extends PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	global.main.change_2d_scene("res://scenes/game/Game.tscn")
	global.main.change_gui_scene("res://scenes/pause_menu/PauseMenu.tscn")
	# get_tree().change_scene_to_file("res://scenes/Game.tscn")
	pass # Replace with function body.


func _on_options_pressed() -> void:
	global.main.change_gui_scene("res://scenes/options/Options.tscn")
	# get_tree().change_scene_to_file("res://scenes/Options.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
