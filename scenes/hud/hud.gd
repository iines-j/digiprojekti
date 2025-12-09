extends Control

@export var coin_label : Label
var camera

func _ready() -> void:
	SignalBus.coins_changed.connect(add_coins)
	camera = get_viewport().get_camera_2d()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	coin_label.text = str(Player.coins)
	

func _on_journal_pressed() -> void:
	camera.in_use = false
	# print("HUD says camera is " + str(camera.in_use))
	global.main.change_gui_scene("res://scenes/journal/Journal.tscn")
	
func _on_camera_pressed() -> void:
	if camera.in_use:
		camera.in_use = false
	else:
		camera.in_use = true

func add_coins():
	Player.coins += Player.coins_add_amount


	
