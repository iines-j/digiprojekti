extends Node

var allowed_to_screenshot = true
var n = 0
var texture
var screen_x = 1152
var screen_y = 648

@export var overlay : TextureRect
@export var hud : Control
var pos
var mouse_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('screenshot') && allowed_to_screenshot:
		
		SignalBus.coins_changed.emit()
	
		overlay.hide()
		hud.hide()
		await RenderingServer.frame_post_draw # wait for frame drawn before taking screenshot
	
		var tex = get_viewport().get_texture()
		var img = tex.get_image()
		var screen_region = Rect2i(pos, Vector2(580,413)) 
		var screenshot = get_viewport().get_texture().get_image().get_region(screen_region)
		texture = ImageTexture.create_from_image(screenshot)
		save_info(texture)
		show_ui()

func save_info(texture):
	var entry = JournalEntries.array[n]
	entry.img = texture
	JournalEntries.changed = true
	var time = Time.get_datetime_dict_from_system()
	var date = str(time.day) + "." + str(time.month) + "." + str(time.year)
	var timestr = str("%02d:%02d:%02d" % [time.hour, time.minute, time.second])
	entry.time = timestr + " " + date
	
	# loop journal entries and rewrite data
	if n < 3:
		n += 1
	else:
		n = 0
	
func show_ui():
	overlay.show()
	hud.show()
