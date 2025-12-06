extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Hop")

func _arrive():
	$AnimationPlayer.play("Hop") # follow path2D while hopping
	
	# stop hopping at target then sit down


func _leave():
	$AnimationPlayer.play_backwards("SitDown") # sit up
	await $AnimationPlayer.animation_finished  
	$AnimationPlayer.play("Hop") # hop out of frame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
