extends CharacterBody2D

const Speed = 200
const Jump_speed = -300.0


@onready var animation_tree: AnimationTree = $AnimationTree
@onready var character_body_2d: CharacterBody2D = $"."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta:float) -> void:
	move()
	animation_tree_condition_handler()

func move() -> void:
	var direction := Input.get_axis("move_left","move_right")
	if direction > 0:
		character_body_2d.scale.x = 0.381
	elif direction < 0:
		character_body_2d.scale.x = -0.381
	velocity.x = direction * Speed
	move_and_slide()



func animation_tree_condition_handler() -> void:
	if velocity.x == 0:
		animation_tree["parameters/conditions/is_reset"] = true
		animation_tree["parameters/conditions/is_run"] = false
	else:
		animation_tree["parameters/conditions/is_reset"] = false
		animation_tree["parameters/conditions/is_run"] = true
