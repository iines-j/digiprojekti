class_name Main extends Node

@export var world_2d : Node2D
@export var gui : Control

var current_2d_scene
var current_gui_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.main = self
	current_gui_scene = $CanvasLayer/GUI/MainMenu
	# print("I am %s and my gui is " % get_path(), gui)

func change_gui_scene(new_scene: String) -> void:
	current_gui_scene.queue_free()
	
	var new = load(new_scene).instantiate()
	gui.add_child(new) # add under GUI node
	current_gui_scene = new  
	
func change_2d_scene(new_scene: String) -> void:
	if current_2d_scene != null:
		current_2d_scene.queue_free()
	
	var new = load(new_scene).instantiate()
	world_2d.add_child(new) # add under World2D node
	current_2d_scene = new  

func close_2d_scene():
	current_2d_scene.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
#	pass
