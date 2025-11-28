extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("blur")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	global.main.change_gui_scene("res://scenes/pause_menu/PauseMenu.tscn")
	get_tree().paused = false
	print("Back to pause menu")
