extends Node2D

var time = 0.0
var cooldown_time = 0.0

func _ready() -> void:
	SignalBus.rabbit_done.connect(_on_rabbit_done)
	_call_rabbit()

func _call_rabbit():
	_new_time()
	AnimalTimers.rabbit_time = time
	$Rabbit._start()
	print("Called rabbit, wait time is " + str(AnimalTimers.rabbit_time))
	
func _on_rabbit_done(done):
	if done:
			print("Saw that rabbit was done!")
			_new_cooldown_time()
			print("Rabbit cooling down for " + str(cooldown_time))
			await get_tree().create_timer(cooldown_time).timeout
			_call_rabbit()

func _new_time():
	time = 0.0
	var rng = RandomNumberGenerator.new()
	time = snapped(rng.randf_range(5.0, 6.0), 0.01)
	# print("Got new time at handler " + str(time))

func _new_cooldown_time():
	cooldown_time = 0.0
	var rng = RandomNumberGenerator.new()
	cooldown_time = snapped(rng.randf_range(5.0, 10.0), 0.01)
	# print("Got new COOL time at handler " + str(cooldown_time))
