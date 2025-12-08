extends Control

@export var entry1 : TextureRect
@export var text1 : RichTextLabel
@export var entry2 : TextureRect
@export var text2 : RichTextLabel
@export var entry3 : TextureRect
@export var text3 : RichTextLabel
@export var entry4 : TextureRect
@export var text4 : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var img1 = JournalEntries.entry1.img
	var time1 = JournalEntries.entry1.time
	var img2 = JournalEntries.entry2.img
	var time2 = JournalEntries.entry2.time
	var img3 = JournalEntries.entry3.img
	var time3 = JournalEntries.entry3.time
	var img4 = JournalEntries.entry4.img
	var time4 = JournalEntries.entry4.time
	pause()
	if JournalEntries.changed:
		entry1.texture = img1
		entry2.texture = img2
		entry3.texture = img3
		entry4.texture = img4
	text1.text = time1
	text2.text = time2
	text3.text = time3
	text4.text = time4
	
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
