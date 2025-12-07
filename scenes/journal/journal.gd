extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# $AnimationPlayer.play("RESET")
	pause()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	await $AnimationPlayer.animation_finished  
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur/blur 2")
	
func _on_back_pressed() -> void:
	global.main.change_gui_scene("res://scenes/pause_menu/PauseMenu.tscn")
	get_tree().paused = false
