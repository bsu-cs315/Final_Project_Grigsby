extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var random = randi()%4+1

func _ready():
	if random == 1:
		$AnimatedSprite2D.play("blue")
		$AnimatedSprite2D.stop()
	elif random == 2:
		$AnimatedSprite2D.play("red")
		$AnimatedSprite2D.stop()
	elif random == 3:
		$AnimatedSprite2D.play("green")
		$AnimatedSprite2D.stop()
	elif random == 4:
		$AnimatedSprite2D.play("yellow")
		$AnimatedSprite2D.stop()

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
	if random == 1:
		$AnimatedSprite2D.play("broken_blue")
	elif random == 2:
		$AnimatedSprite2D.play("broken_red")
	elif random == 3:
		$AnimatedSprite2D.play("broken_green")
	elif random == 4:
		$AnimatedSprite2D.play("broken_yellow")
	$AudioStreamPlayer.play()
