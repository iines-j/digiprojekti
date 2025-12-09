extends Node2D

@onready var path_follow : PathFollow2D = $RabbitPath/PathFollow2D
@onready var sprite : Node2D = $RabbitPath/PathFollow2D/JackrabbitSprite
@export var speed = 120 # speed in px per second
var in_view
var waiting = false
var moving = false
var called = false
var paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# move
	if waiting == false && moving == true:
		if called == false:
			sprite._arrive()
		path_follow.progress += speed * delta
	
	# wait
	# replace w area entered
	if path_follow.progress >= 434 && path_follow.progress <= 438 && called == false:
		called = true
		_wait()
		
	if path_follow.progress >= 1200 && paused == false: # if exited screen
		paused = true
		await get_tree().create_timer(1.0).timeout
		_pause()
	
func _start():
	SignalBus.rabbit_done.emit(false)
	moving = true
	
func _wait():
	paused = false
	waiting = true
	moving = false
	await get_tree().create_timer(0.5).timeout
	sprite._wait()
	$RabbitTimer.wait_time = AnimalTimers.rabbit_time
	$RabbitTimer.start()
	print("Rabbit waiting for " + str($RabbitTimer.wait_time))

func _on_rabbit_timer_timeout() -> void:
	_leave()

func _leave():
	sprite._leave()
	await get_tree().create_timer(1.2).timeout
	waiting = false
	moving = true

func _pause():
	called = false
	moving = false
	SignalBus.rabbit_done.emit(true)
	
