extends Node2D

@export var fog : Node2D
@export var rain : Node2D
var weather_occupied = false
var time
var cooldown_time
var weather : Node2D
var weather_array 
var raining = false
var weather_fade

func _ready() -> void:
	weather_array = [rain]
	weather = weather_array.pick_random()
	fog.hide()
	rain.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if weather_occupied == false:
		weather_occupied = true
		start_weather()

func start_weather():
	new_time()
	pick_weather()
	$WeatherTimer.wait_time = time
	$WeatherTimer.start()
	
	weather.show()
	weather_fade = weather.get_node("AnimationPlayer")
	weather_fade.play("fade")
	
	print("Weather is " + str(weather) + " for " + str(time))
	
	if weather.name == "RainEffect":
		raining = true
		call_fog()
	else:
		raining = false

func call_fog():
	await get_tree().create_timer(3.0).timeout
	var fog_fade = fog.get_node("AnimationPlayer")
	fog.show()
	fog_fade.play("fade")
	await get_tree().create_timer(10.0).timeout
	fog_fade.play_backwards("fade")
	await get_tree().create_timer(3.0).timeout
	fog.hide()

func pick_weather():
	weather = weather_array.pick_random()

func new_time():
	time = 0.0
	var rng = RandomNumberGenerator.new()
	time = snapped(rng.randf_range(8.0, 15.0), 0.01)

func new_cooldown_time():
	cooldown_time = 0.0
	var rng = RandomNumberGenerator.new()
	cooldown_time = snapped(rng.randf_range(10.0, 20.0), 0.01)

func _on_weather_timer_timeout() -> void:
	weather_fade = weather.get_node("AnimationPlayer")
	weather_fade.play_backwards("fade")
	await get_tree().create_timer(3.0).timeout
	weather.hide() 
	
	new_cooldown_time()
	print("Time until next weather: " + str(cooldown_time))
	await get_tree().create_timer(cooldown_time).timeout 
	weather_occupied = false 
	
