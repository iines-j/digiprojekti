extends Control

func _ready():
	$AnimationPlayer.play("RESET")
	self.hide()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	await $AnimationPlayer.animation_finished  
	self.hide()
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	self.show()
	
func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_options_pressed() -> void:
	global.main.change_gui_scene("res://scenes/pause_menu/OptionsPause.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	global.main.change_gui_scene("res://scenes/main_menu/MainMenu.tscn")
	global.main.close_2d_scene()
	
func _on_quit_pressed() -> void:
	get_tree().quit()

func _process(delta):
	testEsc()
