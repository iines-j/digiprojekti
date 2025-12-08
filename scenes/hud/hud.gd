extends Control
# Called when the node enters the scene tree for the first time.
var camera

func _ready() -> void:
	camera = get_viewport().get_camera_2d()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_journal_pressed() -> void:
	camera.in_use = false
	# print("HUD says camera is " + str(camera.in_use))
	global.main.change_gui_scene("res://scenes/journal/Journal.tscn")
	
func _on_camera_pressed() -> void:
	if camera.in_use:
		camera.in_use = false
	else:
		camera.in_use = true

	
	
