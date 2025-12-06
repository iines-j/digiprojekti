extends Node2D

@onready var path_follow : PathFollow2D = $JackrabbitPath/PathFollow2D
@export var speed = 100 # speed in px per second
var inView
var waiting = false
var moving = true
var state = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# check if visible or not
	if path_follow.progress >= 59.87 || path_follow.progress <= 0.9081:
		inView = true
	else:
		inView = false
	
	# move
	if waiting == false && moving == true:
		path_follow.progress += speed * delta
		state = ", moving"
	
	# wait
	if path_follow.progress >= 434 && path_follow.progress <= 438 :
		waiting = true
		moving = false
		state = ", waiting"
	
	print("RABBIT: inView = " + str(inView) + state)
	


# wait at path_follow.progress = 434.29
