class_name Cat
extends CharacterBody2D

const JUMP_VELOCITY = -600.0
const SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("whack") and is_on_floor():
		$AnimatedSprite2D.play("whack")
		$Area2D/Whack_collision.disabled = false
		$WhackTimer.start()

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("walk")
		$Area2D/Whack_collision.disabled = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.y != 0:
		$AnimatedSprite2D.play("jump")
		
	if velocity.x == 0 and velocity.y == 0 and not Input.is_anything_pressed():
		$AnimatedSprite2D.play("idle")
	
	if velocity.x > 0:
		$AnimatedSprite2D.scale.x = 1
		$Area2D/Whack_collision.position.x = 11
	elif velocity.x < 0:
		$AnimatedSprite2D.scale.x = -1
		$Area2D/Whack_collision.position.x = -11

	move_and_slide()




func _on_area_2d_body_entered(body):
	body.knock_over()


func _on_timer_timeout():
	$Area2D/Whack_collision.disabled = true


func _on_area_2d_area_entered(area):
	area.knock_over()
