extends Area2D

func knock_over():
	$AnimatedSprite2D.play("scratched")
	$ScratchCollision.set_deferred("disabled", true)
	$AudioStreamPlayer.play()
