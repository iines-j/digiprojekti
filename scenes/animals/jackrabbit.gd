extends Node2D

func _arrive():
	$AnimationPlayer.play("Hop")
	
func _wait():
	$AnimationPlayer.play("SitDown")
	await $AnimationPlayer.animation_finished  
	$AnimationPlayer.play("SitIdle")

func _leave():
	$AnimationPlayer.play_backwards("SitDown")
	$AnimationPlayer.queue("Hop") # hop out of frame
