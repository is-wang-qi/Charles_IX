extends CharacterBody2D

const Speed = 800
const Jump_speed = -1000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = Jump_speed
	var direction := Input.get_axis("move_left","move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idel")
		else:
			animated_sprite.play("Walk")
	else:
		animated_sprite.play("Jump")
	
	if direction:
		velocity.x = direction * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
		
	move_and_slide()


	
	
