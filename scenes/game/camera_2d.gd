extends Camera2D

# https://github.com/godotengine/godot/issues/44358
var inv_canv_tfm: Transform2D = self.get_canvas_transform().affine_inverse()
var half_screen: Transform2D = Transform2D().translated(get_viewport_rect().size / 2)
var actual_screen_center_pos: Vector2 = inv_canv_tfm * half_screen * Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var in_use = false

const dead_zone = 100

func _process(delta):
	if in_use:
		self.zoom = Vector2(1.5,1.5)
		camera_update()
	else:
		self.zoom = Vector2(1.0,1.0)
		set_position(actual_screen_center_pos)
		

func camera_update():
	var pos = get_local_mouse_position()
	if pos.x >= -2000 && pos.x < 2000:
		set_position(pos)
