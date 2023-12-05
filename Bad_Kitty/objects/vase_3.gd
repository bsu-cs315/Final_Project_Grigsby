extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
func knock_over():
	$NormalCollision.set_deferred("disabled", true)
	$Timer.start()


func _on_timer_timeout():
	$BrokenCollision.set_deferred("disabled", false)
	change_sprite()
	
func change_sprite():
	$AnimatedSprite2D.play("broken")
	$AudioStreamPlayer.play()
