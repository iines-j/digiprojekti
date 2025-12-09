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

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Entered rabbit area")
	Player.coins_add_amount += 5
	print(str(Player.coins_add_amount))

func _on_area_2d_area_exited(area: Area2D) -> void:
	print("Left rabbit area")
	Player.coins_add_amount = 0
