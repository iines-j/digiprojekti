extends Camera2D

# https://github.com/godotengine/godot/issues/44358
var inv_canv_tfm: Transform2D = self.get_canvas_transform().affine_inverse()
var half_screen: Transform2D = Transform2D().translated(get_viewport_rect().size / 2)
var actual_screen_center_pos: Vector2 = inv_canv_tfm * half_screen * Vector2(0, 0)

@export var camera_overlay: HBoxContainer
var in_use = false


func _ready() -> void:
	Screenshot.overlay = $"../CanvasLayer/CameraOverlay/TextureRect"
	Screenshot.hud = $"../CanvasLayer/HUD"
	camera_overlay.hide()

func _process(delta):
	if in_use:
		Screenshot.allowed_to_screenshot = true
		camera_overlay.show()
		self.zoom = Vector2(1.5,1.5)
		camera_update()
	else:
		Screenshot.allowed_to_screenshot = false
		camera_overlay.hide()
		self.zoom = Vector2(1.0,1.0)
		set_position(actual_screen_center_pos)

	
# make camera follow mouse
func camera_update():
	# https://www.youtube.com/watch?v=P0VMQ40VTtc comment by user @alyxxiee
	var pos = get_local_mouse_position()
	if pos.x >= -2000 && pos.x < 2000:
		set_position(pos)
		Screenshot.mouse_pos = pos
		Screenshot.pos = $"../CanvasLayer/TargetView".global_position
		

	
