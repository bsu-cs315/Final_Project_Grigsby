extends CharacterBody2D

const JUMP_VELOCITY = -500.0
const SPEED = 300.0

@onready var _animated_sprite := $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("whack") and is_on_floor():
		$AnimatedSprite2D.play("whack")

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var animation_name := "walk" if velocity.x != 0 else "idle"
	_animated_sprite.play(animation_name)
	
	if velocity.y != 0:
		_animated_sprite.play("jump")
	
	if velocity.x > 0:
		_animated_sprite.scale.x = 1
	elif velocity.x < 0:
		_animated_sprite.scale.x = -1

	move_and_slide()
